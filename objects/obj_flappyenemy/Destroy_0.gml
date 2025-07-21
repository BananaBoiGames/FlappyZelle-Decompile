var _d = audio_play_sound(snd_screamdoh, 1, false);
audio_sound_pitch(_d, 1 + random_range(-0.3, 0.3));
instance_create_depth(x, y, depth + 1, obj_blood);
