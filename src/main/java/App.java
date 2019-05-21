import static spark.Spark.*;

import com.google.gson.Gson;
import models.Foodtype;
import models.Restaurant;
import models.Review;
import models.dao.Sql2oFoodtypeDao;
import models.dao.Sql2oRestaurantDao;
import models.dao.Sql2oReviewDao;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

public class App {
    public static void main(String[] args) {
        Sql2oFoodtypeDao foodtypeDao;
        Sql2oRestaurantDao restaurantDao;
        Sql2oReviewDao reviewDao;
        Connection conn;
        Gson gson = new Gson();

        staticFileLocation("/public");
        String connectionString = "jdbc:h2:~/jadle.db;INIT=RUNSCRIPT from 'classpath:db/create.sql'";
        Sql2o sql2o = new Sql2o(connectionString, "", "");

        restaurantDao = new Sql2oRestaurantDao(sql2o);
        foodtypeDao = new Sql2oFoodtypeDao(sql2o);
        reviewDao = new Sql2oReviewDao(sql2o);
        conn = sql2o.open();

        //CREATE
        post("/restaurants/new", "application/json", (req, res) -> { //accept a request in format JSON from an app
            Restaurant restaurant = gson.fromJson(req.body(), Restaurant.class);//make java from JSON with GSON
            restaurantDao.add(restaurant);//Do our thing with our DAO
            res.status(201);//A-OK! But why 201??
            return gson.toJson(restaurant);//send it back to be displayed
        });

        post("/foodtypes/new", "application/json", (req, res) -> {
            Foodtype foodtype = gson.fromJson(req.body(), Foodtype.class);
            foodtypeDao.add(foodtype);
            res.status(201);
            return gson.toJson(foodtype);
        });

        //READ
        get("/restaurants", "application/json", (req, res) -> {
            System.out.println(restaurantDao.getAll());

            if(restaurantDao.getAll().size() > 0){
                return gson.toJson(restaurantDao.getAll());
            }

            else {
                return "{\"message\":\"I'm sorry, but no restaurants are currently listed in the database.\"}";
            }

        });

        get("/restaurants/:id", "application/json", (req, res) -> { //accept a request in format JSON from an app
            int restaurantId = Integer.parseInt(req.params("id"));
            return gson.toJson(restaurantDao.findById(restaurantId));
        });

        get("/restaurants/:id/reviews", "application/json", (req, res) -> {
            int restaurantId = Integer.parseInt(req.params("id"));

            Restaurant restaurantToFind = restaurantDao.findById(restaurantId);
            List<Review> allReviews;

            if (restaurantToFind == null){
                throw new ApiException(404, String.format("No restaurant with the id: \"%s\" exists", req.params("id")));
            }

            allReviews = reviewDao.getAllReviewsByRestaurant(restaurantId);

            return gson.toJson(allReviews);
        });

        //FILTERS
        after((req, res) ->{
            res.type("application/json");
        });

    }
}