require_relative('../spec_helper')

describe "Deleting a review" do 
  it "destroys the review and shows the review without the deleted review" do
    movie  = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes)

    visit movie_path(movie)
    click_link '1 Review'
    click_link "Delete Review"

    expect(current_path).to eq(movie_path)
    expect(page).not_to have_text(movie.title)
    expect(page).to have_text("Movie Successfully Deleted!")
  end
end
