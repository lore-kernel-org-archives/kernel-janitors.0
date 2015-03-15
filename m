From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 15 Mar 2015 11:11:30 +0000
Subject: re: ASoC: Intel: add function to load sound effect module waves
Message-Id: <20150315111130.GA21169@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Lu, Han,

The patch 8c43fc2fdda0: "ASoC: Intel: add function to load sound
effect module waves" from Mar 10, 2015, leads to the following static
checker warning:

	sound/soc/intel/sst-haswell-pcm.c:1017 hsw_pcm_probe()
	error: buffer overflow 'hsw_dais' 4 <= 4

sound/soc/intel/sst-haswell-pcm.c
   979          /* allocate DSP buffer page tables */
   980          for (i = 0; i < ARRAY_SIZE(hsw_dais); i++) {
   981  
   982                  /* playback */
   983                  if (hsw_dais[i].playback.channels_min) {
   984                          mutex_init(&priv_data->pcm[i][SNDRV_PCM_STREAM_PLAYBACK].mutex);
   985                          ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dma_dev,
   986                                  PAGE_SIZE, &priv_data->dmab[i][0]);
   987                          if (ret < 0)
   988                                  goto err;
   989                  }
   990  
   991                  /* capture */
   992                  if (hsw_dais[i].capture.channels_min) {
   993                          mutex_init(&priv_data->pcm[i][SNDRV_PCM_STREAM_CAPTURE].mutex);
   994                          ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dma_dev,
   995                                  PAGE_SIZE, &priv_data->dmab[i][1]);
   996                          if (ret < 0)
   997                                  goto err;
   998                  }
   999          }
  1000  
  1001          /* allocate runtime modules */
  1002          ret = hsw_pcm_create_modules(priv_data);
  1003          if (ret < 0)
  1004                  goto err;
			^^^^^^^^
i = ARRAY_SIZE(hsw_dais).

  1005  
  1006          /* enable runtime PM with auto suspend */
  1007          pm_runtime_set_autosuspend_delay(platform->dev,
  1008                  SST_RUNTIME_SUSPEND_DELAY);
  1009          pm_runtime_use_autosuspend(platform->dev);
  1010          pm_runtime_enable(platform->dev);
  1011          pm_runtime_idle(platform->dev);
  1012  
  1013          return 0;
  1014  
  1015  err:
  1016          for (;i >= 0; i--) {
  1017                  if (hsw_dais[i].playback.channels_min)
                            ^^^^^^^^^^^
We're off by one.

  1018                          snd_dma_free_pages(&priv_data->dmab[i][0]);
  1019                  if (hsw_dais[i].capture.channels_min)
  1020                          snd_dma_free_pages(&priv_data->dmab[i][1]);
  1021          }
  1022          return ret;

regards,
dan carpenter
