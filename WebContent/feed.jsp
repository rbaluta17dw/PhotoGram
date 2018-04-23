<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
<meta charset="UTF-8">
<title>PhotoGram Feed</title>
<jsp:include page="include/feed.html"></jsp:include>
</head>

<body>

	<div id="app">
		<div class="app__phone">
			<div class="phone-header">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/500px-Instagram_logo.svg.png" />
				<p class="cancel-cta" v-if="step === 2 || step === 3"
					@click="goToHome">Cancel</p>
				<p class="next-cta" v-if="step === 2" @click="step++">Next</p>
				<p class="next-cta" v-if="step === 3" @click="sharePost">Share</p>
			</div>
			<transition name="fade">
			<div class="feed" v-if="step === 1" v-dragscroll.y="true">
				<instagram-post v-for="post in posts" :post="post"
					:key="posts.indexOf(post)"> </instagram-post>
			</div>
			</transition>
			<div v-if="step === 2">
				<div class="selected-image" :class="filterType"
					:style="{ backgroundImage: 'url(' + image + ')' }"></div>
				<div class="filter-container" v-dragscroll.x="true">
					<filter-type v-for="filter in filters" :filter="filter"
						:image="image" :key="filter.name"> </filter-type>
				</div>
			</div>
			<div v-if="step === 3">
				<div class="selected-image" :class="filterType"
					:style="{ backgroundImage: 'url(' + image + ')' }"></div>
				<div class="caption-container">
					<textarea class="caption-input" placeholder="Write a caption..."
						type="text" v-model="caption">
        </textarea>
				</div>
			</div>
			<div class="phone-footer">
				<div class="home-cta" @click="goToHome">
					<i class="fas fa-home fa-lg"></i>
				</div>
			</div>
		</div>
	</div>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.min.js'></script>
	<script
		src='https://unpkg.com/vue-dragscroll@1.3.1/dist/vue-dragscroll.min.js'></script>



	<script src="js/feed.js"></script>




</body>

</html>
