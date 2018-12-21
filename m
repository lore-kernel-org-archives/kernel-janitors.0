From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Dec 2018 10:00:49 +0000
Subject: Re: [bug report] net: hns: Fix ping failed when use net bridge and send multicast
Message-Id: <20181221100049.GC2240@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181220094600.GA13233@kadam>
In-Reply-To: <20181220094600.GA13233@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Dec 21, 2018 at 12:59:20PM +0300, Dan Carpenter wrote:
> On Fri, Dec 21, 2018 at 11:40:36AM +0800, liuyonglong wrote:
> > Hi, Dan Carpenter:
> > 
> > On 2018/12/20 17:46, Dan Carpenter wrote:
> > > Hello Yonglong Liu,
> > > 
> > > The patch 6adafc356e20: "net: hns: Fix ping failed when use net
> > > bridge and send multicast" from Dec 15, 2018, leads to the following
> > > static checker warning:
> > > 
> > > 	drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c:2822 set_promisc_tcam_enable()
> > > 	error: testing array offset 'port' after use.
> > > 
> > > drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c
> > >   2786  
> > >   2787          mac_cb = dsaf_dev->mac_cb[port];
> > >                                    ^^^^^^^^^^^^
> > > The ->mac_cb[] array has 6 elements.
> > > 
> > >   2788          (void)hns_mac_get_inner_port_num(mac_cb, 0, &port_num);
> > >   2789          tbl_tcam_ucast.tbl_ucast_out_port = port_num;
> > >   2790  
> > >   2791          /* config uc vague table */
> > >   2792          hns_dsaf_tcam_uc_cfg_vague(dsaf_dev, entry_index, &tbl_tcam_data_uc,
> > >   2793                                     &tbl_tcam_mask_uc, &tbl_tcam_ucast);
> > >   2794  
> > >   2795          /* update software entry */
> > >   2796          soft_mac_entry = priv->soft_mac_tbl;
> > >   2797          soft_mac_entry += entry_index;
> > >   2798          soft_mac_entry->index = entry_index;
> > >   2799          soft_mac_entry->tcam_key.high.val = mac_key.high.val;
> > >   2800          soft_mac_entry->tcam_key.low.val = mac_key.low.val;
> > >   2801          /* step back to the START for mc. */
> > >   2802          soft_mac_entry = priv->soft_mac_tbl;
> > >   2803  
> > >   2804          /* 2. set promisc multicast vague tcam entry. */
> > >   2805          entry_index = hns_dsaf_find_empty_mac_entry_reverse(dsaf_dev);
> > >   2806          if (entry_index = DSAF_INVALID_ENTRY_IDX) {
> > >   2807                  dev_err(dsaf_dev->dev,
> > >   2808                          "enable mc promisc failed (port:%#x)\n",
> > >   2809                          port);
> > >   2810                  return;
> > >   2811          }
> > >   2812  
> > >   2813          memset(&mask_entry, 0x0, sizeof(mask_entry));
> > >   2814          memset(&mask_key, 0x0, sizeof(mask_key));
> > >   2815          memset(&temp_key, 0x0, sizeof(temp_key));
> > >   2816          mask_entry.addr[0] = 0x01;
> > >   2817          hns_dsaf_set_mac_key(dsaf_dev, &mask_key, mask_entry.in_vlan_id,
> > >   2818                               port, mask_entry.addr);
> > >   2819          tbl_tcam_mcast.tbl_mcast_item_vld = 1;
> > >   2820          tbl_tcam_mcast.tbl_mcast_old_en = 0;
> > >   2821  
> > >   2822          if (port < DSAF_SERVICE_NW_NUM) {
> > >                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > 
> > >   2823                  mskid = port;
> > >   2824          } else if (port >= DSAF_BASE_INNER_PORT_NUM) {
> > >                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > 
> > > Here we are testing if "port" is over 127 but we are so toasted if
> > > that condition is true.
> > > 
> > 
> > set_promisc_tcam_enable is only called by hns_dsaf_set_promisc_tcam,
> > and hns_dsaf_set_promisc_tcam is only called by hns_mac_set_promisc.
> > hns_mac_set_promisc pass "mac_cb->mac_id" to the parameter "port", so the range of "port" is equals to "mac_cb->mac_id".
> > 
> > When hns_mac_init, "mac_cb->mac_id" is limited to smaller than 6, so it's no problem.
> 
> If it's 6 then it is one element past the end of the array.

Sorry, I misread.  You said smaller than 6, so that's fine.  But the
rest of the email still applies.

regards,
dan carpenter
