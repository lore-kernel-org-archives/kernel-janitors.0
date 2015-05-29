From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 May 2015 15:06:54 +0000
Subject: re: net: Adding support for Cavium ThunderX network controller
Message-Id: <20150529150654.GE10313@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150529150444.GD10313@mwanda>
In-Reply-To: <20150529150444.GD10313@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sunil Goutham,

The patch 4863dea3fab0: "net: Adding support for Cavium ThunderX
network controller" from May 26, 2015, leads to the following static
checker warning:

	drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c:517 nicvf_set_rxfh()
	warn: we tested 'hkey' before and it was 'false'

drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c
   506          /* We do not allow change in unsupported parameters */
   507          if (hkey ||
                    ^^^^
We return here.

   508              (hfunc != ETH_RSS_HASH_NO_CHANGE && hfunc != ETH_RSS_HASH_TOP))
   509                  return -EOPNOTSUPP;
   510  
   511          rss->enable = true;
   512          if (indir) {
   513                  for (idx = 0; idx < rss->rss_size; idx++)
   514                          rss->ind_tbl[idx] = indir[idx];
   515          }
   516  
   517          if (hkey) {
                    ^^^^
So this is dead code.

   518                  memcpy(rss->key, hkey, RSS_HASH_KEY_SIZE * sizeof(u64));
   519                  nicvf_set_rss_key(nic);
   520          }
   521  
   522          nicvf_config_rss(nic);
   523          return 0;
   524  }

regards,
dan carpenter
