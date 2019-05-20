import static spark.Spark.*;

import com.google.gson.Gson;
import models.Restaurant;
import models.dao.Sql2oFoodtypeDao;
import models.dao.Sql2oRestaurantDao;
import models.dao.Sql2oReviewDao;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

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

        post("/restaurants/new", "application/json", (req, res) -> { //accept a request in format JSON from an app
            Restaurant restaurant = gson.fromJson(req.body(), Restaurant.class);//make java from JSON with GSON
            restaurantDao.add(restaurant);//Do our thing with our DAO
            res.status(201);//A-OK! But why 201??
            res.type("application/json");
            return gson.toJson(restaurant);//send it back to be displayed
        });
    }
}