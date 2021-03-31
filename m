Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8E1C433ED
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 Mar 2021 15:27:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B8E66101D
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 Mar 2021 15:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236282AbhCaP0i (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 Mar 2021 11:26:38 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38506 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236272AbhCaP0V (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Mar 2021 11:26:21 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VFPAiN133922;
        Wed, 31 Mar 2021 15:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=wEjonCKtkZXVVZPcSGEFtXQO0T235YN2Cf/vO2mnvdg=;
 b=B00l/h8ph6JMZnfhDnufOmNMHK6kV+21ZB+Ldxt72gVEENzm4cC07OCUnUYlcgjB3iKb
 hOo8xRqlezMZavNmuWn6PAkTc81m9rnx3zi2BzlgBxFqm660lleXdhq5WmXIe3LQSkBT
 lkQYpjRgMwIg+kCahC2aoEgnZCaW5HpuwxuBC9ofIIYnuLqi1vn64KQrFl8FP00rI04n
 gN5rU4ds5LyvHBnkdw8X60KNHDbXF1wSotLBspRXpu+PKKXecN9y+cRoq579WCBe+p4c
 4qbpT+4wZb559JbiTuklZtXxFbO7a7BPa3nnF8SXb12E29Sfm/EE5l6zcACO9unDhzXK RQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 37mp06s4am-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 31 Mar 2021 15:26:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VFOsuM175031;
        Wed, 31 Mar 2021 15:26:09 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 37mac8t68a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 31 Mar 2021 15:26:08 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12VFQ7Tl011646;
        Wed, 31 Mar 2021 15:26:08 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 31 Mar 2021 08:26:06 -0700
Date:   Wed, 31 Mar 2021 18:26:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alexander Popov <alex.popov@linux.com>
Cc:     kernel-janitors@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: Exploitable bugs in AF_VSOCK implementation
Message-ID: <20210331152600.GQ2088@kadam>
References: <b57de8d1-e62b-cf74-89b8-c7a3b73b9cc0@linux.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <b57de8d1-e62b-cf74-89b8-c7a3b73b9cc0@linux.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310108
X-Proofpoint-ORIG-GUID: OqGXOD5vZxgGWLiyyppj_mbxMCRzSMyM
X-Proofpoint-GUID: OqGXOD5vZxgGWLiyyppj_mbxMCRzSMyM
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 clxscore=1011 bulkscore=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310108
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

I enjoyed reading your blog entries for CVE-2017-2636 and CVE-2019-18683.

https://lore.kernel.org/lkml/20210201084719.2257066-1-alex.popov@linux.com/

My understanding is that you were able to write a privilege escalataion
bug for this?  Are you going to do a write up for this one as well?  Was
the trick to exploiting it to use the free in vsock_deassign_transport()?

I've wanted to look for these in Smatch (my static analysis tool) for a
long time.  I wrote a very naive first draft implementation.  What it
looks for is when we access struct sock members before calling
lock_sock().  It generated 8 warnings.  Six were false positives but I
think that two were probably real bugs.

net/nfc/llcp_sock.c:313 nfc_llcp_getsockopt() warn: unlocked access 'llcp_sock->local' expected lock '&sk->sk_lock.slock'
net/nfc/llcp_sock.c:597 llcp_sock_release() warn: unlocked access 'llcp_sock->local' expected lock '&sk->sk_lock.slock'

But I think it would be hard to exploit those because the race is very
tiny.

Several people (maybe most recently Lukas Bulwahn but someone else at
Linux Plumbers) suggested that a way to find race conditions is to look
at the line directly after taking a lock.  So if you have:

	mutex_lock(&dsp->pwr_lock);
	if (!dsp->wmfw_file_name || !dsp->booted)

Then that means that the ->pwr_lock is protecting ->wmfw_file_name and
->booted.  So I wrote a check that made a list of these sorts of
pairings.  Then I wrote a check that said:

If you take save a "protected" struct member and then take the lock
print a warning that the access should have been inside the lock.  So a
warning looks like this:

sound/pci/cs46xx/cs46xx_lib.c:2148 snd_cs46xx_spdif_default_get() warn: unlocked access 'ins' (line 2146) expected lock '&chip->spos_mutex'
  2142  static int snd_cs46xx_spdif_default_get(struct snd_kcontrol *kcontrol,
  2143                                          struct snd_ctl_elem_value *ucontrol)
  2144  {
  2145          struct snd_cs46xx *chip = snd_kcontrol_chip(kcontrol);
  2146          struct dsp_spos_instance * ins = chip->dsp_spos_instance;
                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch is saying this assignment should have been done

  2147  
  2148          mutex_lock(&chip->spos_mutex);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
inside this lock.

  2149          ucontrol->value.iec958.status[0] = _wrap_all_bits((ins->spdif_csuv_default >> 24) & 0xff);
  2150          ucontrol->value.iec958.status[1] = _wrap_all_bits((ins->spdif_csuv_default >> 16) & 0xff);
  2151          ucontrol->value.iec958.status[2] = 0;
  2152          ucontrol->value.iec958.status[3] = _wrap_all_bits((ins->spdif_csuv_default) & 0xff);
  2153          mutex_unlock(&chip->spos_mutex);
  2154  
  2155          return 0;
  2156  }

That seems probably true but also a pretty harmless.  I've attached a
sample of the output just in case you're curious.

Do you have any idea how I could get more worthwhile results than this?

regards,
dan carpenter



--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=err-list

block/blk-mq.c:3613 blk_mq_elv_switch_none() warn: unlocked access 'qe->type' (line 3610) expected lock '&q->sysfs_lock'
drivers/acpi/power.c:216 acpi_power_get_list_state() warn: unlocked access 'handle' (line 213) expected lock '&resource->resource_lock'
drivers/atm/idt77252.c:819 drain_scq() warn: unlocked access 'scq' (line 793) expected lock '&scq->skblock'
drivers/base/power/qos.c:116 dev_pm_qos_read_value() warn: unlocked access 'qos' (line 112) expected lock '&dev->power.lock'
drivers/block/drbd/drbd_nl.c:1165 drbd_check_al_size() warn: unlocked access 't' (line 1157) expected lock '&device->al_lock'
drivers/block/loop.c:1222 __loop_clr_fd() warn: unlocked access 'filp' (line 1210) expected lock '&lo->lo_lock'
drivers/block/nbd.c:1425 nbd_ioctl() warn: unlocked access 'config' (line 1413) expected lock '&nbd->config_lock'
drivers/bus/mhi/core/pm.c:548 mhi_pm_disable_transition() warn: unlocked access 'mhi_event' (line 531) expected lock '&mhi_cntrl->pm_lock'
drivers/char/virtio_console.c:692 fill_readbuf() warn: unlocked access 'buf' (line 671) expected lock '&port->inbuf_lock'
drivers/dma/hisi_dma.c:435 hisi_dma_irq() warn: unlocked access 'hdma_dev' (line 431) expected lock '&chan->vc.lock'
drivers/dma/k3dma.c:736 k3_dma_terminate_all() warn: unlocked access 'p' (line 724) expected lock '&c->vc.lock'
drivers/dma/sun6i-dma.c:868 sun6i_dma_resume() warn: unlocked access 'pchan' (line 863) expected lock '&vchan->vc.lock'
drivers/dma/tegra20-apb-dma.c:362 tegra_dma_global_pause() warn: unlocked access 'tdma' (line 360) expected lock '&tdma->global_lock'
drivers/hwmon/max6697.c:191 max6697_update_device() warn: unlocked access 'client' (line 185) expected lock '&data->update_lock'
drivers/i2c/busses/i2c-i801.c:1651 i801_acpi_io_handler() warn: unlocked access 'pdev' (line 1643) expected lock '&priv->acpi_lock'
drivers/iio/gyro/adis16130.c:57 adis16130_spi_read() warn: unlocked access 'xfer.rx_buf' (line 53) expected lock '&st->buf_lock'
drivers/infiniband/hw/hfi1/pio.c:1301 sc_enable() warn: unlocked access 'dd' (line 1292) expected lock '&sc->alloc_lock'
drivers/infiniband/hw/hfi1/qp.c:494 iowait_sleep() warn: unlocked access 'priv' (line 492) expected lock '&qp->s_lock'
drivers/infiniband/hw/hfi1/rc.c:1649 hfi1_restart_rc() warn: unlocked access 'priv' (line 1608) expected lock '&$->s_lock'
drivers/infiniband/hw/hfi1/ruc.c:575 hfi1_do_send() warn: unlocked access 'priv' (line 538) expected lock '&qp->s_lock'
drivers/infiniband/hw/hfi1/tid_rdma.c:2014 tid_rdma_rcv_error() warn: unlocked access 'qpriv' (line 1992) expected lock '&qp->s_lock'
drivers/infiniband/hw/hfi1/verbs.c:939 pio_wait() warn: unlocked access 'priv' (line 928) expected lock '&qp->s_lock'
drivers/infiniband/hw/mlx5/odp.c:200 free_implicit_child_mr_work() warn: unlocked access 'imr' (line 194) expected lock '&odp_imr->umem_mutex'
drivers/infiniband/hw/qib/qib_ruc.c:286 qib_do_send() warn: unlocked access 'priv' (line 265) expected lock '&qp->s_lock'
drivers/infiniband/hw/qib/qib_sdma.c:627 qib_sdma_verbs_send() warn: unlocked access 'priv' (line 624) expected lock '&qp->s_lock'
drivers/infiniband/hw/qib/qib_verbs.c:566 __get_txreq() warn: unlocked access 'priv' (line 562) expected lock '&qp->s_lock'
drivers/infiniband/sw/rdmavt/cq.c:490 rvt_resize_cq() warn: unlocked access 'ip' (line 475) expected lock '&rdi->pending_lock'
drivers/infiniband/sw/rdmavt/srq.c:291 rvt_modify_srq() warn: unlocked access 'ip' (line 270) expected lock '&dev->pending_lock'
drivers/input/rmi4/rmi_f54.c:199 rmi_f54_request_report() warn: unlocked access 'rmi_dev' (line 180) expected lock '&f54->data_mutex'
drivers/isdn/mISDN/stack.c:444 connect_layer1() warn: unlocked access 'ch->st' (line 436) expected lock '&dev->D.st->l1sock.lock'
drivers/lightnvm/pblk-core.c:1553 pblk_line_replace_data() warn: unlocked access 'new' (line 1549) expected lock '&l_mg->free_lock'
drivers/md/dm-clone-metadata.c:810 dm_clone_metadata_pre_commit() warn: unlocked access 'dmap' (line 795) expected lock '&cmd->bitmap_lock'
drivers/md/dm-region-hash.c:665 dm_rh_recovery_end() warn: unlocked access 'rh' (line 663) expected lock '&rh->region_lock'
drivers/md/md-bitmap.c:1792 md_bitmap_destroy() warn: unlocked access 'bitmap' (line 1783) expected lock '&mddev->bitmap_info.mutex'
drivers/md/raid1.c:282 reschedule_retry() warn: unlocked access 'mddev' (line 277) expected lock '&conf->device_lock'
drivers/md/raid5-cache.c:1162 r5c_calculate_new_cp() warn: unlocked access 'log' (line 1155) expected lock '&log->stripe_in_journal_lock'
drivers/media/dvb-core/dmxdev.c:350 dvb_dmxdev_set_buffer_size() warn: unlocked access 'oldmem' (line 348) expected lock '&dmxdevfilter->dev->lock'
drivers/media/pci/ngene/ngene-core.c:77 demux_tasklet() warn: unlocked access 'Cur' (line 75) expected lock '&chan->state_lock'
drivers/media/pci/tw5864/tw5864-video.c:1225 tw5864_prepare_frame_headers() warn: unlocked access 'vb' (line 1219) expected lock '&input->slock'
drivers/media/platform/exynos4-is/fimc-capture.c:1444 fimc_sensor_notify() warn: unlocked access 'fimc' (line 1439) expected lock '&fimc->slock'
drivers/media/platform/exynos4-is/fimc-lite.c:1170 fimc_lite_subdev_set_selection() warn: unlocked access 'fimc' (line 1156) expected lock '&fimc->slock'
drivers/media/platform/qcom/camss/camss-ispif.c:366 ispif_set_power() warn: unlocked access 'dev' (line 363) expected lock '&ispif->power_lock'
drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c:969 rkisp1_vb2_stop_streaming() warn: unlocked access 'rkisp1' (line 966) expected lock '&cap->rkisp1->stream_lock'
drivers/media/platform/s3c-camif/camif-capture.c:1454 s3c_camif_subdev_set_selection() warn: unlocked access 'camif' (line 1438) expected lock '&camif->slock'
drivers/media/rc/rc-main.c:710 ir_timer_repeat() warn: unlocked access 'input' (line 707) expected lock '&dev->keylock'
drivers/media/usb/dvb-usb/cxusb-analog.c:439 cxusb_medion_copy_field() warn: unlocked access '_cxdev' (line 436) expected lock 'cxdev->videodev->lock'
drivers/media/usb/dvb-usb-v2/af9015.c:26 af9015_ctrl_msg() warn: unlocked access 'intf' (line 22) expected lock '&d->usb_mutex'
drivers/media/usb/dvb-usb-v2/af9035.c:43 af9035_ctrl_msg() warn: unlocked access 'intf' (line 39) expected lock '&d->usb_mutex'
drivers/media/usb/dvb-usb-v2/gl861.c:39 gl861_ctrl_msg() warn: unlocked access 'intf' (line 34) expected lock '&d->usb_mutex'
drivers/media/usb/dvb-usb-v2/zd1301.c:32 zd1301_ctrl_msg() warn: unlocked access 'intf' (line 29) expected lock '&d->usb_mutex'
drivers/media/usb/uvc/uvc_ctrl.c:2134 uvc_ctrl_add_mapping() warn: unlocked access 'dev' (line 2098) expected lock '&chain->ctrl_mutex'
drivers/message/fusion/mptfc.c:201 mptfc_block_error_handler() warn: unlocked access 'hd' (line 199) expected lock 'shost->host_lock'
drivers/message/fusion/mptlan.c:892 mpt_lan_receive_post_turbo() warn: unlocked access 'skb' (line 859) expected lock '&priv->rxfidx_lock'
drivers/message/fusion/mptsas.c:3691 mptsas_expander_add() warn: unlocked access 'port_info->phy_info' (line 3688) expected lock '&ioc->sas_topology_mutex'
drivers/message/fusion/mptscsih.c:2800 mptscsih_do_cmd() warn: unlocked access 'ioc' (line 2785) expected lock '&ioc->internal_cmds.mutex'
drivers/message/fusion/mptspi.c:626 mptscsih_quiesce_raid() warn: unlocked access 'ioc' (line 620) expected lock '&ioc->internal_cmds.mutex'
drivers/misc/mei/bus.c:662 mei_cldev_enable() warn: unlocked access 'cl' (line 660) expected lock '&bus->device_lock'
drivers/mmc/host/rtsx_pci_sdmmc.c:824 sd_request() warn: unlocked access 'mrq' (line 796) expected lock '&host->host_mutex'
drivers/mmc/host/vub300.c:1751 vub300_cmndwork_thread() warn: unlocked access 'cmd' (line 1748) expected lock '&vub300->cmd_mutex'
drivers/most/most_cdev.c:190 comp_write() warn: unlocked access 'c' (line 188) expected lock '&c->io_mutex'
drivers/mtd/mtd_blkdevs.c:196 mtd_queue_rq() warn: unlocked access 'dev' (line 190) expected lock '&dev->queue_lock'
drivers/mtd/ubi/cdev.c:548 vol_cdev_ioctl() warn: unlocked access 'vol' (line 383) expected lock '&ubi->device_mutex'
drivers/net/can/spi/mcp251x.c:950 mcp251x_stop() warn: unlocked access 'spi' (line 941) expected lock '&priv->mcp_lock'
drivers/net/dsa/sja1105/sja1105_main.c:1846 sja1105_static_config_reload() warn: unlocked access 'ds' (line 1839) expected lock '&priv->mgmt_lock'
drivers/net/ethernet/brocade/bna/bnad.c:2115 bnad_reinit_rx() warn: unlocked access 'netdev' (line 2103) expected lock '&bnad->bna_lock'
drivers/net/ethernet/cisco/enic/enic_api.c:43 enic_api_devcmd_proxy_by_index() warn: unlocked access 'vdev' (line 34) expected lock '&enic->devcmd_lock'
drivers/net/ethernet/freescale/gianfar.c:2660 gfar_poll_rx_sq() warn: unlocked access 'regs' (line 2643) expected lock '&gfargrp->grplock'
drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5499 hclge_fd_disable_user_def() warn: unlocked access 'cfg' (line 5497) expected lock '&hdev->fd_rule_lock'
drivers/net/ethernet/intel/iavf/iavf_main.c:975 iavf_down() warn: unlocked access 'netdev' (line 960) expected lock '&adapter->mac_vlan_list_lock'
drivers/net/ethernet/intel/ice/ice_common.c:3854 ice_ena_vsi_txq() warn: unlocked access 'hw' (line 3849) expected lock '&pi->sched_lock'
drivers/net/ethernet/intel/ice/ice_dcb_lib.c:869 ice_dcb_process_lldp_set_mib_change() warn: unlocked access 'pi' (line 846) expected lock '&pf->tc_mutex'
drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:1784 nix_txschq_free_one() warn: unlocked access 'pfvf_map' (line 1783) expected lock '&rvu->rsrc_lock'
drivers/net/ethernet/marvell/sky2.c:831 sky2_wol_init() warn: unlocked access 'hw' (line 810) expected lock '&sky2->phy_lock'
drivers/net/ethernet/mellanox/mlx4/cmd.c:2189 mlx4_master_do_cmd() warn: unlocked access 'slave_state' (line 2099) expected lock '&priv->mfunc.master.slave_state_lock'
drivers/net/ethernet/mellanox/mlx4/eq.c:480 mlx4_master_handle_slave_flr() warn: unlocked access 'slave_state' (line 459) expected lock '&priv->mfunc.master.slave_state_lock'
drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:598 mlx5e_ethtool_set_coalesce() warn: unlocked access 'mdev' (line 576) expected lock '&priv->state_lock'
drivers/net/ethernet/mellanox/mlx5/core/en_main.c:1801 mlx5e_set_tx_maxrate() warn: unlocked access 'mdev' (line 1783) expected lock '&priv->state_lock'
drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun_encap.c:1222 mlx5e_detach_encap_route() warn: unlocked access 'r' (line 1215) expected lock '&esw->offloads.encap_tbl_lock'
drivers/net/ethernet/mellanox/mlx5/core/fpga/tls.c:77 mlx5_fpga_tls_cmd_complete() warn: unlocked access 'conn' (line 72) expected lock '&tls->pending_cmds_lock'
drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:559 mlx5i_open() warn: unlocked access 'mdev' (line 556) expected lock '&epriv->state_lock'
drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c:197 mlx5i_pkey_open() warn: unlocked access 'mdev' (line 194) expected lock '&epriv->state_lock'
drivers/net/ethernet/pensando/ionic/ionic_lif.c:136 ionic_link_status_check() warn: unlocked access 'netdev' (line 116) expected lock '&lif->queue_lock'
drivers/net/ethernet/qlogic/qed/qed_roce.c:139 qed_roce_alloc_cid() warn: unlocked access 'p_rdma_info' (line 134) expected lock '&p_hwfn->p_rdma_info->lock'
drivers/net/ethernet/qlogic/qla3xxx.c:3426 ql_adapter_down() warn: unlocked access 'ndev' (line 3399) expected lock '&qdev->hw_lock'
drivers/net/ethernet/sfc/mcdi_filters.c:597 efx_mcdi_filter_remove_internal() warn: unlocked access 'table' (line 577) expected lock '&$->filter_sem'
drivers/net/ethernet/sun/niu.c:7242 niu_get_ethtool_tcam_all() warn: unlocked access 'parent' (line 7233) expected lock '&np->parent->lock'
drivers/net/ethernet/sun/sunhme.c:694 happy_meal_timer() warn: unlocked access 'tregs' (line 691) expected lock '&hp->happy_lock'
drivers/net/ieee802154/adf7242.c:444 adf7242_read_reg() warn: unlocked access 'xfer.tx_buf' (line 438) expected lock '&lp->bmux'
drivers/net/ieee802154/cc2520.c:231 cc2520_cmd_strobe() warn: unlocked access 'xfer.rx_buf' (line 225) expected lock '&priv->buffer_mutex'
drivers/net/phy/phylink.c:654 phylink_resolve() warn: unlocked access 'ndev' (line 650) expected lock '&pl->state_mutex'
drivers/net/wan/lmc/lmc_main.c:631 lmc_watchdog() warn: unlocked access 'dev' (line 626) expected lock '&sc->lmc_lock'
drivers/net/wireless/ath/ath10k/ce.c:1241 ath10k_ce_cancel_send_next() warn: unlocked access 'src_ring' (line 1233) expected lock '&ce->ce_lock'
drivers/net/wireless/ath/ath10k/debug.c:2404 ath10k_peer_ps_state_disable() warn: unlocked access 'arsta' (line 2402) expected lock '&ar->data_lock'
drivers/net/wireless/ath/ath10k/debugfs_sta.c:111 ath10k_sta_update_rx_tid_stats() warn: unlocked access 'arsta' (line 109) expected lock '&ar->data_lock'
drivers/net/wireless/ath/ath10k/mac.c:3912 ath10k_mac_tx_h_fill_cb() warn: unlocked access 'arsta' (line 3911) expected lock '&ar->data_lock'
drivers/net/wireless/ath/ath10k/pci.c:1362 ath10k_pci_hif_tx_sg() warn: unlocked access 'src_ring' (line 1356) expected lock '&ce->ce_lock'
drivers/net/wireless/ath/ath10k/sdio.c:939 ath10k_sdio_mbox_read_int_status() warn: unlocked access 'irq_proc_reg' (line 934) expected lock '&irq_data->mtx'
drivers/net/wireless/ath/ath11k/mac.c:3415 ath11k_mac_op_sta_rc_update() warn: unlocked access 'arsta' (line 3393) expected lock '&ar->data_lock'
drivers/net/wireless/ath/ath9k/beacon.c:674 ath9k_beacon_config() warn: unlocked access 'ah' (line 627) expected lock '&sc->sc_pm_lock'
drivers/net/wireless/ath/ath9k/gpio.c:203 ath_btcoex_period_timer() warn: unlocked access 'ah' (line 197) expected lock '&sc->sc_pm_lock'
drivers/net/wireless/ath/ath9k/link.c:327 ath_ani_calibrate() warn: unlocked access 'ah' (line 308) expected lock '&sc->sc_pm_lock'
drivers/net/wireless/ath/ath9k/main.c:264 ath_complete_reset() warn: unlocked access 'ah' (line 237) expected lock '&sc->sc_pm_lock'
drivers/net/wireless/ath/ath9k/recv.c:1195 ath_rx_tasklet() warn: unlocked access 'ah' (line 1065) expected lock '&sc->sc_pm_lock'
drivers/net/wireless/broadcom/b43legacy/main.c:1219 b43legacy_beacon_update_trigger_work() warn: unlocked access 'dev' (line 1217) expected lock '&wl->irq_lock'
drivers/net/wireless/intel/ipw2x00/ipw2200.c:5628 ipw_merge_adhoc_network() warn: unlocked access 'match.network' (line 5619) expected lock '&priv->ieee->lock'
drivers/net/wireless/intersil/hostap/hostap_ap.c:1309 handle_authen() warn: unlocked access 'ap' (line 1289) expected lock '&local->ap->sta_table_lock'
drivers/net/wireless/marvell/mwl8k.c:5457 mwl8k_ampdu_action() warn: unlocked access 'addr' (line 5451) expected lock '&priv->stream_lock'
drivers/net/wireless/mediatek/mt76/mt76x02_mac.c:1031 mt76x02_update_channel() warn: unlocked access 'state' (line 1028) expected lock '&dev->mt76.cc_lock'
drivers/nvme/target/fcloop.c:620 fcloop_fcp_recv_work() warn: unlocked access 'fcpreq' (line 616) expected lock '&tfcp_req->reqlock'
drivers/pcmcia/pcmcia_resource.c:632 pcmcia_request_io() warn: unlocked access 'c' (line 629) expected lock '&s->ops_mutex'
drivers/platform/surface/aggregator/ssh_packet_layer.c:778 ssh_ptl_queue_remove() warn: unlocked access 'ptl' (line 776) expected lock '&ptl->queue.lock'
drivers/platform/surface/surface_dtx.c:490 surface_dtx_read() warn: unlocked access 'ddev' (line 462) expected lock '&client->ddev->lock'
drivers/rapidio/rio.c:1627 rio_route_add_entry() warn: unlocked access 'ops' (line 1618) expected lock '&rdev->rswitch->lock'
drivers/scsi/3w-9xxx.c:163 twa_show_stats() warn: unlocked access 'tw_dev' (line 159) expected lock 'tw_dev->host->host_lock'
drivers/scsi/3w-sas.c:111 twl_sysfs_aen_read() warn: unlocked access 'tw_dev' (line 104) expected lock 'tw_dev->host->host_lock'
drivers/scsi/3w-xxxx.c:498 tw_show_stats() warn: unlocked access 'tw_dev' (line 494) expected lock 'tw_dev->host->host_lock'
drivers/scsi/a100u2w.c:1064 inia100_intr() warn: unlocked access 'host' (line 1060) expected lock 'shost->host_lock'
drivers/scsi/advansys.c:7117 advansys_reset() warn: unlocked access 'boardp' (line 7061) expected lock 'shost->host_lock'
drivers/scsi/aha1740.c:349 aha1740_queuecommand_lck() warn: unlocked access 'cmd' (line 319) expected lock 'SCpnt->device->host->host_lock'
drivers/scsi/aic94xx/aic94xx_hwi.h:326 asd_ascb_free() warn: unlocked access 'asd_ha' (line 322) expected lock '&ascb->ha->seq.tc_index_lock'
drivers/scsi/aic94xx/aic94xx_scb.c:209 asd_deform_port() warn: unlocked access 'port' (line 205) expected lock '&asd_ha->asd_ports_lock'
drivers/scsi/aic94xx/aic94xx_tmf.c:343 asd_clear_nexus() warn: unlocked access 'tascb' (line 328) expected lock '&task->task_state_lock'
drivers/scsi/arcmsr/arcmsr_hba.c:1540 arcmsr_done4abort_postqueue() warn: unlocked access 'pmu' (line 1533) expected lock '&acb->doneq_lock'
drivers/scsi/bfa/bfad.c:842 bfad_drv_init() warn: unlocked access 'bfad->bfa.trcmod' (line 832) expected lock '&bfad->bfad_lock'
drivers/scsi/bnx2i/bnx2i_hwi.c:1349 bnx2i_process_scsi_cmd_resp() warn: unlocked access 'conn' (line 1340) expected lock '&session->back_lock'
drivers/scsi/BusLogic.c:3007 blogic_hostreset() warn: unlocked access 'adapter' (line 3001) expected lock 'SCpnt->device->host->host_lock'
drivers/scsi/csiostor/csio_scsi.c:2253 csio_scan_finished() warn: unlocked access 'ln' (line 2250) expected lock 'shost->host_lock'
drivers/scsi/dc395x.c:4477 dc395x_show_info() warn: unlocked access 'acb' (line 4468) expected lock '(acb->scsi_host)->host_lock'
drivers/scsi/esas2r/esas2r_targdb.c:68 esas2r_targ_db_remove_all() warn: unlocked access 't' (line 64) expected lock '&a->mem_lock'
drivers/scsi/esp_scsi.c:2504 esp_eh_abort_handler() warn: unlocked access 'esp' (line 2496) expected lock 'esp->host->host_lock'
drivers/scsi/fdomain.c:271 fdomain_work() warn: unlocked access 'cmd' (line 266) expected lock 'sh->host_lock'
drivers/scsi/imm.c:770 imm_interrupt() warn: unlocked access 'cmd' (line 722) expected lock 'host->host_lock'
drivers/scsi/initio.c:2644 i91u_bus_reset() warn: unlocked access 'host' (line 2642) expected lock 'cmnd->device->host->host_lock'
drivers/scsi/ipr.c:3465 ipr_read_trace() warn: unlocked access 'ioa_cfg' (line 3461) expected lock 'ioa_cfg->host->host_lock'
drivers/scsi/ips.c:796 ips_eh_abort() warn: unlocked access 'ha' (line 788) expected lock 'host->host_lock'
drivers/scsi/isci/task.c:556 isci_task_abort_task() warn: unlocked access 'idev' (line 503) expected lock '&ihost->scic_lock'
drivers/scsi/libfc/fc_fcp.c:800 fc_fcp_recv() warn: unlocked access 'lport' (line 781) expected lock '&fsp->scsi_pkt_lock'
drivers/scsi/libiscsi.c:2446 iscsi_eh_session_reset() warn: unlocked access 'conn' (line 2443) expected lock '&session->frwd_lock'
drivers/scsi/libsas/sas_expander.c:902 sas_ex_discover_end_dev() warn: unlocked access 'child->port' (line 796) expected lock '&parent->port->dev_list_lock'
drivers/scsi/lpfc/lpfc_attr.c:4204 lpfc_stat_data_ctrl_store() warn: unlocked access 'vport' (line 4152) expected lock 'v_shost->host_lock'
drivers/scsi/lpfc/lpfc_hbadisc.c:5092 lpfc_cleanup_node() warn: unlocked access 'mb' (line 5083) expected lock '&phba->hbalock'
drivers/scsi/lpfc/lpfc_init.c:4567 lpfc_scan_finished() warn: unlocked access 'vport' (line 4563) expected lock 'shost->host_lock'
drivers/scsi/lpfc/lpfc_nportdisc.c:1812 lpfc_rcv_logo_reglogin_issue() warn: unlocked access 'mb' (line 1802) expected lock '&phba->hbalock'
drivers/scsi/lpfc/lpfc_nvmet.c:1269 lpfc_nvmet_defer_rcv() warn: unlocked access 'nvmebuf' (line 1247) expected lock '&ctxp->ctxlock'
drivers/scsi/lpfc/lpfc_scsi.c:6079 lpfc_bus_reset_handler() warn: unlocked access 'vport' (line 6051) expected lock 'shost->host_lock'
drivers/scsi/lpfc/lpfc_sli.c:8309 lpfc_mbox_timeout_handler() warn: unlocked access 'pmbox' (line 8291) expected lock '&phba->hbalock'
drivers/scsi/megaraid/megaraid_sas_base.c:2903 megasas_reset_timer() warn: unlocked access 'instance' (line 2900) expected lock 'instance->host->host_lock'
drivers/scsi/mpt3sas/mpt3sas_scsih.c:1817 scsih_change_queue_depth() warn: unlocked access 'sas_target_priv_data' (line 1811) expected lock '&ioc->sas_device_lock'
drivers/scsi/mvumi.c:2123 mvumi_timed_out() warn: unlocked access 'mhba' (line 2119) expected lock 'mhba->shost->host_lock'
drivers/scsi/pcmcia/sym53c500_cs.c:356 SYM53C500_intr() warn: unlocked access 'data' (line 352) expected lock 'dev->host_lock'
drivers/scsi/pmcraid.c:2719 pmcraid_reset_device() warn: unlocked access 'pinstance' (line 2706) expected lock 'pinstance->host->host_lock'
drivers/scsi/qedf/qedf_els.c:117 qedf_initiate_els() warn: unlocked access 'qedf' (line 33) expected lock '&fcport->rport_lock'
drivers/scsi/qedf/qedf_io.c:1935 qedf_initiate_abts() warn: unlocked access 'qedf' (line 1871) expected lock '&fcport->rport_lock'
drivers/scsi/qedi/qedi_fw.c:43 qedi_process_logout_resp() warn: unlocked access 'conn' (line 35) expected lock '&session->back_lock'
drivers/scsi/qla1280.c:1223 qla1280_slave_configure() warn: unlocked access 'ha' (line 1191) expected lock 'ha->host->host_lock'
drivers/scsi/qla2xxx/qla_init.c:115 qla24xx_abort_iocb_timeout() warn: unlocked access 'qpair' (line 101) expected lock 'qpair->qp_lock_ptr'
drivers/scsi/qla2xxx/qla_iocb.c:1624 qla24xx_start_scsi() warn: unlocked access 'req' (line 1609) expected lock '&ha->hardware_lock'
drivers/scsi/qla2xxx/qla_mbx.c:3239 qla24xx_abort_command() warn: unlocked access 'qpair' (line 3226) expected lock 'qpair->qp_lock_ptr'
drivers/scsi/qla2xxx/qla_mr.c:3094 qlafx00_start_scsi() warn: unlocked access 'req' (line 3088) expected lock '&ha->hardware_lock'
drivers/scsi/qla2xxx/qla_os.c:1259 qla2xxx_eh_abort() warn: unlocked access 'qpair' (line 1252) expected lock 'qpair->qp_lock_ptr'
drivers/scsi/qla2xxx/qla_target.c:733 qlt_fc_port_added() warn: unlocked access 'tgt' (line 712) expected lock '&vha->vha_tgt.tgt_mutex'
drivers/scsi/qla4xxx/ql4_isr.c:387 qla4xxx_passthru_status_entry() warn: unlocked access 'conn' (line 386) expected lock '&conn->session->back_lock'
drivers/scsi/stex.c:1261 stex_abort() warn: unlocked access 'hba' (line 1251) expected lock 'host->host_lock'
drivers/scsi/sym53c8xx_2/sym_glue.c:598 sym_eh_handler() warn: unlocked access 'sym_data' (line 577) expected lock 'shost->host_lock'
drivers/scsi/ufs/ufshcd.c:2656 ufshcd_queuecommand() warn: unlocked access 'hba' (line 2600) expected lock 'hba->host->host_lock'
drivers/scsi/virtio_scsi.c:180 virtscsi_vq_done() warn: unlocked access 'vq' (line 178) expected lock '&virtscsi_vq->vq_lock'
drivers/scsi/wd719x.c:272 wd719x_queuecommand() warn: unlocked access 'wd' (line 212) expected lock 'wd->sh->host_lock'
drivers/scsi/xen-scsifront.c:541 scsifront_queuecommand() warn: unlocked access 'info' (line 531) expected lock 'shost->host_lock'
drivers/soc/fsl/dpio/dpio-service.c:740 dpaa2_io_query_fq_count() warn: unlocked access 'swp' (line 739) expected lock '&d->lock_mgmt_cmd'
drivers/soc/qcom/qmi_interface.c:694 qmi_handle_release() warn: unlocked access 'sock' (line 686) expected lock '&qmi->sock_lock'
drivers/soundwire/bus.c:648 sdw_assign_device_num() warn: unlocked access 'bus' (line 641) expected lock '&slave->bus->bus_lock'
drivers/soundwire/slave.c:68 sdw_slave_add() warn: unlocked access 'slave->dev.parent' (line 37) expected lock '&bus->bus_lock'
drivers/staging/comedi/drivers/vmk80xx.c:409 vmk80xx_do_insn_bits() warn: unlocked access 'rx_buf' (line 396) expected lock '&devpriv->limit_sem'
drivers/staging/iio/meter/ade7854-spi.c:31 ade7854_spi_write_reg() warn: unlocked access 'xfer.tx_buf' (line 26) expected lock '&st->buf_lock'
drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.c:133 free_pages_to_dynamic_pool() warn: unlocked access 'hmm_page->page' (line 128) expected lock '&dypool_info->list_lock'
drivers/staging/rtl8192e/rtl8192e/rtl_core.c:1233 _rtl92e_if_silent_reset() warn: unlocked access 'ieee' (line 1213) expected lock '&priv->wx_mutex'
drivers/staging/rtl8192e/rtl8192e/rtl_wx.c:168 _rtl92e_wx_adapter_power_status() warn: unlocked access 'ieee' (line 166) expected lock '&priv->wx_mutex'
drivers/staging/rtl8192u/r8192U_core.c:3117 rtl819x_ifsilentreset() warn: unlocked access 'ieee' (line 3105) expected lock '&priv->wx_mutex'
drivers/staging/rtl8192u/r8192U_wx.c:341 r8192_wx_set_scan() warn: unlocked access 'ieee' (line 322) expected lock '&priv->wx_mutex'
drivers/staging/rts5208/rtsx.c:165 command_abort() warn: unlocked access 'dev' (line 159) expected lock 'host->host_lock'
drivers/target/iscsi/iscsi_target_erl1.c:1107 iscsit_handle_dataout_timeout() warn: unlocked access 'conn' (line 1101) expected lock '&cmd->dataout_timeout_lock'
drivers/target/iscsi/iscsi_target_login.c:739 iscsi_post_login_handler() warn: unlocked access 'sess' (line 680) expected lock '&se_tpg->session_lock'
drivers/target/iscsi/iscsi_target_tmr.c:217 iscsit_task_reassign_complete_nop_out() warn: unlocked access 'cr' (line 206) expected lock '&conn->cmd_lock'
drivers/thermal/gov_fair_share.c:108 fair_share_throttle() warn: unlocked access 'cdev' (line 95) expected lock '&instance->cdev->lock'
drivers/thermal/intel/intel_soc_dts_iosf.c:84 sys_get_trip_temp() warn: unlocked access 'dts' (line 82) expected lock '&sensors->dts_update_lock'
drivers/tty/n_tty.c:1702 n_tty_receive_buf_common() warn: unlocked access 'ldata' (line 1699) expected lock '&tty->termios_rwsem'
drivers/tty/tty_ldsem.c:211 down_read_failed() warn: unlocked access '___p1' (line 196) expected lock '&sem->wait_lock'
drivers/usb/class/usbtmc.c:228 usbtmc_flush() warn: unlocked access 'data' (line 225) expected lock '&data->io_mutex'
drivers/usb/core/message.c:1704 usb_reset_configuration() warn: unlocked access 'config' (line 1702) expected lock 'hcd->bandwidth_mutex'
drivers/usb/gadget/function/u_serial.c:1378 gserial_disconnect() warn: unlocked access 'port' (line 1371) expected lock '&port->port_lock'
drivers/usb/gadget/udc/fotg210-udc.c:489 fotg210_set_halt_and_wedge() warn: unlocked access 'fotg210' (line 487) expected lock '&ep->fotg210->lock'
drivers/usb/gadget/udc/gr_udc.c:1546 gr_ep_enable() warn: unlocked access 'dev' (line 1480) expected lock '&ep->dev->lock'
drivers/usb/gadget/udc/mv_u3d_core.c:861 mv_u3d_ep_dequeue() warn: unlocked access 'u3d' (line 859) expected lock '&ep->u3d->lock'
drivers/usb/gadget/udc/mv_udc_core.c:783 mv_ep_dequeue() warn: unlocked access 'udc' (line 775) expected lock '&ep->udc->lock'
drivers/usb/misc/yurex.c:409 yurex_read() warn: unlocked access 'dev' (line 407) expected lock '&dev->io_mutex'
drivers/usb/serial/io_ti.c:1924 edge_open() warn: unlocked access 'edge_serial' (line 1923) expected lock '&edge_serial->es_lock'
drivers/usb/serial/ti_usb_3410_5052.c:1227 ti_bulk_in_callback() warn: unlocked access 'port' (line 1191) expected lock '&tport->tp_lock'
drivers/usb/storage/uas.c:1117 uas_pre_reset() warn: unlocked access 'devinfo' (line 1110) expected lock 'shost->host_lock'
drivers/vdpa/vdpa_sim/vdpa_sim.c:147 vdpasim_map_page() warn: unlocked access 'iommu' (line 137) expected lock '&vdpasim->iommu_lock'
drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c:123 vfio_fsl_mc_set_irq_trigger() warn: unlocked access 'mc_dev' (line 111) expected lock '&vdev->reflck->lock'
drivers/vfio/pci/vfio_pci_config.c:585 vfio_basic_config_write() warn: unlocked access 'pdev' (line 559) expected lock '&vdev->memory_lock'
drivers/vfio/pci/vfio_pci_config.c:585 vfio_basic_config_write() warn: unlocked access 'pdev' (line 559) expected lock '&vdev->memory_lock'
drivers/vfio/pci/vfio_pci_intrs.c:262 vfio_msi_enable() warn: unlocked access 'pdev' (line 249) expected lock '&vdev->memory_lock'
drivers/xen/gntdev-dmabuf.c:406 dmabuf_exp_from_pages() warn: unlocked access 'gntdev_dmabuf->priv' (line 374) expected lock '&args->dmabuf_priv->lock'
fs/9p/cache.c:184 v9fs_cache_inode_reset_cookie() warn: unlocked access 'old' (line 182) expected lock '&v9inode->fscache_lock'
fs/afs/dynroot.c:299 afs_dynroot_mkdir() warn: unlocked access 'sb' (line 278) expected lock '&$->proc_cells_lock'
fs/block_dev.c:1319 __blkdev_get() warn: unlocked access 'disk' (line 1292) expected lock '&whole->bd_mutex'
fs/btrfs/dev-replace.c:332 btrfs_init_dev_replace_tgtdev() warn: unlocked access 'device->fs_devices' (line 326) expected lock '&fs_info->fs_devices->device_list_mutex'
fs/btrfs/disk-io.c:4209 write_all_supers() warn: unlocked access 'sb' (line 4122) expected lock '&$->tree_log_mutex'
fs/btrfs/inode.c:4295 btrfs_delete_subvolume() warn: unlocked access 'dest' (line 4271) expected lock '&fs_info->subvol_sem'
fs/btrfs/ioctl.c:1995 btrfs_ioctl_subvol_getflags() warn: unlocked access 'root' (line 1988) expected lock '&fs_info->subvol_sem'
fs/btrfs/qgroup.c:1527 btrfs_create_qgroup() warn: unlocked access 'quota_root' (line 1516) expected lock '&fs_info->qgroup_lock'
fs/btrfs/sysfs.c:732 btrfs_label_show() warn: unlocked access 'label' (line 729) expected lock '&fs_info->super_lock'
fs/btrfs/transaction.c:2351 btrfs_commit_transaction() warn: unlocked access 'cur_trans' (line 2321) expected lock '&fs_info->trans_lock'
fs/btrfs/tree-log.c:3072 btrfs_sync_log() warn: unlocked access 'log' (line 3063) expected lock '&root->log_mutex'
fs/btrfs/volumes.c:2778 btrfs_init_new_device() warn: unlocked access 'fs_devices' (line 2577) expected lock '&fs_info->fs_devices->device_list_mutex'
fs/buffer.c:793 invalidate_inode_buffers() warn: unlocked access 'buffer_mapping' (line 791) expected lock '&buffer_mapping->private_lock'
fs/cachefiles/namei.c:265 cachefiles_mark_object_inactive() warn: unlocked access 'dentry' (line 260) expected lock '&cache->active_lock'
fs/ceph/caps.c:4117 ceph_handle_caps() warn: unlocked access 'mdsc' (line 4002) expected lock '&session->s_mutex'
fs/ceph/dir.c:156 __dcache_find_get_entry() warn: unlocked access 'dir' (line 131) expected lock '&parent->d_lockref.lock'
fs/ceph/mds_client.c:3235 handle_reply() warn: unlocked access 'mdsc' (line 3109) expected lock '&session->s_mutex'
fs/ceph/quota.c:255 get_quota_realm() warn: unlocked access 'realm' (line 221) expected lock '&$->snap_rwsem'
fs/cifs/dir.c:780 cifs_d_revalidate() warn: unlocked access 'inode' (line 747) expected lock '&direntry->d_lockref.lock'
fs/dax.c:415 dax_lock_page() warn: unlocked access 'mapping' (line 397) expected lock '&((&xas)->xa)->xa_lock'
fs/dcache.c:695 dentry_kill() warn: unlocked access 'inode' (line 687) expected lock '&parent->d_lockref.lock'
fs/dlm/lock.c:5952 dlm_user_adopt_orphan() warn: unlocked access 'ua->proc' (line 5938) expected lock '&ua->proc->locks_spin'
fs/eventpoll.c:762 ep_free() warn: unlocked access 'rbp' (line 747) expected lock '&ep->mtx'
fs/ext2/super.c:58 ext2_error() warn: unlocked access 'es' (line 55) expected lock '&sbi->s_lock'
fs/ext4/mballoc.c:4745 ext4_mb_add_n_trim() warn: unlocked access 'sb' (line 4732) expected lock '&tmp_pa->pa_lock'
fs/f2fs/gc.c:1893 update_sb_metadata() warn: unlocked access 'raw_sb' (line 1886) expected lock '&sbi->sb_lock'
fs/f2fs/node.c:555 f2fs_get_node_info() warn: unlocked access 'journal' (line 529) expected lock '&curseg->journal_rwsem'
fs/f2fs/segment.c:4096 remove_sits_in_journal() warn: unlocked access 'journal' (line 4093) expected lock '&curseg->journal_rwsem'
fs/fs-writeback.c:305 locked_inode_to_wb_and_lock_list() warn: unlocked access 'wb' (line 295) expected lock '&wb->list_lock'
fs/gfs2/dir.c:368 gfs2_dir_get_hash_table() warn: unlocked access 'hc' (line 344) expected lock '&inode->i_lock'
fs/io_uring.c:1425 __io_cqring_overflow_flush() warn: unlocked access 'rings' (line 1417) expected lock '&ctx->completion_lock'
fs/jbd2/checkpoint.c:500 __jbd2_journal_clean_checkpoint_list() warn: unlocked access 'transaction' (line 483) expected lock '&$->j_list_lock'
fs/jbd2/commit.c:471 jbd2_journal_commit_transaction() warn: unlocked access 'commit_transaction' (line 465) expected lock '&journal->j_state_lock'
fs/jbd2/journal.c:369 jbd2_journal_write_metadata_buffer() warn: unlocked access 'journal' (line 351) expected lock '&jh_in->b_state_lock'
fs/jbd2/transaction.c:961 do_get_write_access() warn: unlocked access 'journal' (line 949) expected lock '&jh->b_state_lock'
fs/jffs2/file.c:164 jffs2_write_begin() warn: unlocked access 'inode' (line 136) expected lock '&f->sem'
fs/jfs/jfs_extent.c:538 extBalloc() warn: unlocked access 'bmp' (line 502) expected lock '&ji->ag_lock'
fs/jfs/jfs_metapage.c:290 remove_from_logsync() warn: unlocked access 'log' (line 281) expected lock '&log->synclock'
fs/nfsd/nfs4state.c:5169 nfsd4_process_open2() warn: unlocked access 'cl' (line 5152) expected lock '&stp->st_mutex'
fs/nfsd/vfs.c:542 nfsd4_clone_file_range() warn: unlocked access 'dst' (line 538) expected lock '&nf_dst->nf_rwsem'
fs/nfs/unlink.c:136 nfs_call_unlink() warn: unlocked access 'dir' (line 119) expected lock '&alias->d_lockref.lock'
fs/nilfs2/segment.c:357 nilfs_transaction_lock() warn: unlocked access 'sci' (line 344) expected lock '&nilfs->ns_segctor_sem'
fs/ntfs/aops.c:213 ntfs_read_block() warn: unlocked access 'vol' (line 183) expected lock '&ni->size_lock'
fs/ntfs/attrib.c:217 ntfs_map_runlist_nolock() warn: unlocked access 'put_this_page' (line 140) expected lock '&old_ctx.ntfs_ino->mrec_lock'
fs/ntfs/compress.c:542 ntfs_read_compressed_block() warn: unlocked access 'vol' (line 468) expected lock '&ni->size_lock'
fs/ntfs/file.c:384 ntfs_prepare_file_for_write() warn: unlocked access 'vol' (line 327) expected lock '&ni->size_lock'
fs/ntfs/inode.c:2418 ntfs_truncate() warn: unlocked access 'vol' (line 2350) expected lock '&ni->size_lock'
fs/ntfs/lcnalloc.c:167 ntfs_cluster_alloc() warn: unlocked access 'lcnbmp_vi' (line 155) expected lock '&vol->lcnbmp_lock'
fs/ntfs/logfile.c:739 ntfs_empty_logfile() warn: unlocked access 'vol' (line 716) expected lock '&log_ni->size_lock'
fs/ntfs/mft.c:1039 ntfs_may_write_mft_record() warn: unlocked access 'sb' (line 923) expected lock '&ni->extent_lock'
fs/ocfs2/dcache.c:57 ocfs2_dentry_revalidate() warn: unlocked access 'inode' (line 44) expected lock '&dentry->d_lockref.lock'
fs/ocfs2/quota_global.c:451 ocfs2_global_write_info() warn: unlocked access 'info' (line 449) expected lock '&dqopt->dqio_sem'
fs/orangefs/file.c:315 orangefs_revalidate_mapping() warn: unlocked access 'mapping' (line 307) expected lock '&inode->i_lock'
fs/quota/quota_v2.c:199 v2_write_file_info() warn: unlocked access 'qinfo' (line 196) expected lock '&dqopt->dqio_sem'
fs/udf/super.c:2030 udf_open_lvid() warn: unlocked access 'bh' (line 2019) expected lock '&sbi->s_alloc_mutex'
fs/xfs/xfs_icache.c:212 xfs_inode_set_reclaim_tag() warn: unlocked access 'mp' (line 208) expected lock '&pag->pag_ici_lock'
kernel/bpf/percpu_freelist.c:149 ___pcpu_freelist_pop() warn: unlocked access 'node' (line 134) expected lock '&s->extralist.lock'
kernel/events/core.c:328 event_function_local() warn: unlocked access 'task' (line 316) expected lock '&cpuctx->ctx.lock'
kernel/locking/rwsem.c:985 rwsem_down_read_slowpath() warn: unlocked access '___p1' (line 980) expected lock '&sem->wait_lock'
kernel/rcu/tree.c:1728 note_gp_changes() warn: unlocked access 'rnp' (line 1725) expected lock '&(*(&rnp->lock))'
kernel/rcu/tree_plugin.h:1470 rcu_prepare_for_idle() warn: unlocked access 'rnp' (line 1469) expected lock '&(*(&rnp->lock))'
kernel/rcu/tree_stall.h:192 rcu_iw_handler() warn: unlocked access 'rnp' (line 191) expected lock '&(*(&rnp->lock))'
kernel/taskstats.c:563 taskstats_tgid_alloc() warn: unlocked access 'sig' (line 552) expected lock '&tsk->sighand->siglock'
kernel/time/hrtimer.c:173 lock_hrtimer_base() warn: unlocked access 'base' (line 171) expected lock '&base->cpu_base->lock'
kernel/trace/ftrace.c:4111 ftrace_hash_move_and_update_ops() warn: unlocked access 'old_hash_ops.notrace_hash' (line 4105) expected lock '&$->func_hash->regex_lock'
net/atm/mpc.c:1221 ingress_purge_rcvd() warn: unlocked access 'entry' (line 1210) expected lock '&mpc->ingress_lock'
net/atm/mpoa_caches.c:307 refresh_entries() warn: unlocked access 'entry' (line 302) expected lock '&client->ingress_lock'
net/bluetooth/l2cap_sock.c:111 l2cap_sock_bind() warn: unlocked access 'chan' (line 84) expected lock '&sk->sk_lock.slock'
net/bluetooth/rfcomm/tty.c:690 rfcomm_tty_cleanup() warn: unlocked access 'dev' (line 686) expected lock '&dev->dlc->lock'
net/dccp/ipv4.c:271 dccp_v4_err() warn: unlocked access 'iph' (line 232) expected lock '&(sk->sk_lock.slock)'
net/dccp/ipv6.c:108 dccp_v6_err() warn: unlocked access 'hdr' (line 70) expected lock '&(sk->sk_lock.slock)'
net/ipv4/route.c:1096 ipv4_sk_update_pmtu() warn: unlocked access 'iph' (line 1089) expected lock '&(sk->sk_lock.slock)'
net/ipv4/tcp_ipv4.c:498 tcp_v4_err() warn: unlocked access 'iph' (line 465) expected lock '&(sk->sk_lock.slock)'
net/ipv6/mcast.c:2548 ip6_mc_add_src() warn: unlocked access 'pmc' (line 2506) expected lock '&$->mc_lock'
net/ipv6/tcp_ipv6.c:401 tcp_v6_err() warn: unlocked access 'hdr' (line 368) expected lock '&(sk->sk_lock.slock)'
net/kcm/kcmsock.c:309 unreserve_rx_kcm() warn: unlocked access 'kcm' (line 303) expected lock '&mux->rx_lock'
net/mac80211/ibss.c:303 __ieee80211_sta_join_ibss() warn: unlocked access 'chan' (line 266) expected lock '&local->mtx'
net/mac80211/iface.c:532 ieee80211_do_stop() warn: unlocked access 'local' (line 370) expected lock '&sdata->u.nan.func_lock'
net/mac80211/mlme.c:1467 ieee80211_sta_process_chanswitch() warn: unlocked access 'cbss' (line 1370) expected lock '&local->chanctx_mtx'
net/mac80211/rx.c:3856 ieee80211_release_reorder_timeout() warn: unlocked access 'rx.sdata' (line 3842) expected lock '&tid_agg_rx->reorder_lock'
net/mac80211/scan.c:477 __ieee80211_scan_completed() warn: unlocked access 'scan_req' (line 440) expected lock '&local->mtx'
net/netfilter/ipvs/ip_vs_lblc.c:236 ip_vs_lblc_flush() warn: unlocked access 'tbl' (line 231) expected lock '&svc->sched_lock'
net/netfilter/ipvs/ip_vs_lblcr.c:402 ip_vs_lblcr_flush() warn: unlocked access 'tbl' (line 397) expected lock '&svc->sched_lock'
net/netfilter/ipvs/ip_vs_wrr.c:143 ip_vs_wrr_dest_changed() warn: unlocked access 'mark' (line 141) expected lock '&svc->sched_lock'
net/sctp/input.c:231 sctp_rcv() warn: unlocked access 'sk' (line 166) expected lock '&(sk->sk_lock.slock)'
net/sctp/sm_sideeffect.c:242 sctp_generate_t3_rtx_event() warn: unlocked access 'sk' (line 236) expected lock '&(sk->sk_lock.slock)'
net/sctp/socket.c:1952 sctp_sendmsg() warn: unlocked access 'ep' (line 1927) expected lock '&sk->sk_lock.slock'
net/smc/smc_cdc.c:157 smcr_cdc_get_slot_and_msg_send() warn: unlocked access 'link' (line 152) expected lock '&conn->send_lock'
net/smc/smc_llc.c:1198 smc_llc_process_srv_add_link() warn: unlocked access 'link' (line 1193) expected lock '&lgr->llc_conf_mutex'
net/smc/smc_tx.c:508 smcr_tx_sndbuf_nonempty() warn: unlocked access 'link' (line 485) expected lock '&conn->send_lock'
net/sunrpc/rpcb_clnt.c:184 rpcb_put_local() warn: unlocked access 'clnt' (line 180) expected lock '&sn->rpcb_clnt_lock'
net/sunrpc/xprtsock.c:1176 xs_reset_transport() warn: unlocked access 'sock' (line 1163) expected lock '&transport->recv_mutex'
net/xfrm/xfrm_policy.c:619 xfrm_byidx_resize() warn: unlocked access 'oidx' (line 612) expected lock '&net->xfrm.xfrm_policy_lock'
security/keys/process_keys.c:45 get_user_register() warn: unlocked access 'reg_keyring' (line 40) expected lock '&user_ns->keyring_sem'
security/keys/request_key.c:401 construct_alloc_key() warn: unlocked access 'key->index_key.type' (line 392) expected lock '&dest_keyring->sem'
sound/pci/cs46xx/cs46xx_lib.c:2148 snd_cs46xx_spdif_default_get() warn: unlocked access 'ins' (line 2146) expected lock '&chip->spos_mutex'
sound/pci/cs46xx/dsp_spos.c:286 cs46xx_dsp_spos_destroy() warn: unlocked access 'ins' (line 281) expected lock '&chip->spos_mutex'
sound/soc/codecs/rt711.c:91 rt711_calibration() warn: unlocked access 'regmap' (line 88) expected lock '&rt711->calibrate_mutex'
sound/soc/codecs/rt711-sdca.c:91 rt711_sdca_calibration() warn: unlocked access 'regmap' (line 87) expected lock '&rt711->calibrate_mutex'
sound/soc/codecs/wm8994.c:3786 wm1811_mic_work() warn: unlocked access 'component' (line 3775) expected lock '&wm8994->accdet_lock'
sound/soc/codecs/wm_adsp.c:4371 wm_adsp2_bus_error() warn: unlocked access 'regmap' (line 4368) expected lock '&dsp->pwr_lock'

--V88s5gaDVPzZ0KCq--
