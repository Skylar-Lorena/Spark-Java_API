package models.dao;

import models.Restaurant;

import java.util.List;

public interface RestaurantDao {
    //create
    void add (Restaurant restaurant);
    // void addRestaurantToFoodType(Restaurant restaurant, Foodtype foodtype)

    //read
    List<Restaurant> getAll();
    Restaurant findById(int id);
    // List<Foodtype> getAllFoodtypesForARestaurant(int restaurantId);

    //update
    void update(int id, String name, String address, String zipcode, String phone, String website, String email);

    //delete
    void deleteById(int id);
    void clearAll();
}
