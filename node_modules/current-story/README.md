# current-story

Fetch the Rally (CA Agile) story ID from the current branch name.

[![Dependency Status](https://david-dm.org/zkochan/current-story/status.svg?style=flat)](https://david-dm.org/zkochan/current-story)
[![Build Status](https://travis-ci.org/zkochan/current-story.svg?branch=master)](https://travis-ci.org/zkochan/current-story)
[![npm version](https://badge.fury.io/js/current-story.svg)](http://badge.fury.io/js/current-story)


## Installation

```
npm install current-story
```


## Example Usage

``` js
const currentStory = require('current-story')

currentStory().then(storyId => console.log(storyId))
```


## License

MIT © [Zoltan Kochan](https://www.kochan.io)
