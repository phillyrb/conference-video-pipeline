# conference-video-pipelines

## Goal

Given the directory structure below, add all images (in order, 3 seconds each)
to the beginning of the video, with the mp3 track laid over, and fade out into
the video. Ideally the audio of the video would also be equalized and
compressed (dynamic range compression).

## Directory Structure
```
assets/
  0-title.png
  1-sponsor.png
  2-sponsor.png
  theme.mp3
source/
  2013-08-11 - Profound and Entertaining- Jane Doe.mp4
  2013-09-10 - A Great Talk - John Doe.mp4
final/
```

## Title Card

It would be cool if the title image could be written to with the date, talk
title, and speaker. All of this would be inferred from the filename.

## Output

Run `rake`. Finished videos appear in `final/`. At least, that's the plan.
