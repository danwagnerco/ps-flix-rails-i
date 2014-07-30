require_relative('../spec_helper')

describe "Deleting a review" do 
  it "destroys the review and shows the index without the deleted review" do
    movie  = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes)

    visit movie_path(movie)
    click_link '1 Review'
    click_link "Roger Ebert"
    click_link "Delete"

    expect(current_path).to eq(movie_reviews_path(movie))
    expect(page).not_to have_text(review.name)
    expect(page).to have_text("Review Successfully Deleted!")
  end
end
