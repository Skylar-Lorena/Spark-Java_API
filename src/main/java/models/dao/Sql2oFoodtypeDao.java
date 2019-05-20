package models.dao;

import models.Foodtype;
import models.Restaurant;
import org.sql2o.Connection;
import org.sql2o.Sql2o;
import org.sql2o.Sql2oException;

import java.util.ArrayList;
import java.util.List;

public class Sql2oFoodtypeDao implements FoodtypeDao{ //don't forget to shake hands with your interface!
    private final Sql2o sql2o;
    public Sql2oFoodtypeDao(Sql2o sql2o){ this.sql2o = sql2o; }

    @Override
    public void add(Foodtype foodtype) {
        String sql = "INSERT INTO foodtypes (name) VALUES (:name)";
        try(Connection con = sql2o.open()){
            int id = (int) con.createQuery(sql, true)
                    .bind(foodtype)
                    .executeUpdate()
                    .getKey();
            foodtype.setId(id);
        } catch (Sql2oException ex) {
            System.out.println(ex);
        }
    }

    @Override
    public List<Foodtype> getAll() {
        try(Connection con = sql2o.open()){
            return con.createQuery("SELECT * FROM foodtypes")
                    .executeAndFetch(Foodtype.class);
        }
    }

    @Override
    public void deleteById(int id) {
        String sql = "DELETE from foodtypes WHERE id=:id"; //raw sql
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        } catch (Sql2oException ex){
            System.out.println(ex);
        }
    }

    @Override
    public void clearAll() {
        String sql = "DELETE from foodtypes";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql).executeUpdate();
        } catch (Sql2oException ex) {
            System.out.println(ex);
        }
    }

    @Override
    public void addFoodtypeToRestaurant(Foodtype foodtype, Restaurant restaurant){

    }

    @Override
    public List<Restaurant> getAllRestaurantsForAFoodtype(int foodtypeId) {
        List<Restaurant> restaurants = new ArrayList();
        return restaurants;
    }

}
