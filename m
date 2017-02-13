From: Madalin-Cristian Bucur <madalin.bucur@nxp.com>
Date: Mon, 13 Feb 2017 12:35:04 +0000
Subject: RE: [bug report] dpaa_eth: add support for DPAA Ethernet
Message-Id: <HE1PR04MB1129A7C6B9A18733C49769C1EC590@HE1PR04MB1129.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207101207.GA31716@mwanda>
In-Reply-To: <20170207101207.GA31716@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, February 07, 2017 12:12 PM
> 
> Hello Madalin Bucur,
> 
> The patch 9ad1a3749333: "dpaa_eth: add support for DPAA Ethernet"
> from Nov 15, 2016, leads to the following static checker warning:
> 
> 	drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:1082
> dpaa_eth_init_tx_port()
> 	warn: 'port' was already freed.
> 
> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
>   1058  static void dpaa_eth_init_tx_port(struct fman_port *port, struct
> dpaa_fq *errq,
>   1059                                    struct dpaa_fq *defq,
>   1060                                    struct dpaa_buffer_layout
> *buf_layout)
>   1061  {
>   1062          struct fman_buffer_prefix_content buf_prefix_content;
>   1063          struct fman_port_params params;
>   1064          int err;
>   1065
>   1066          memset(&params, 0, sizeof(params));
>   1067          memset(&buf_prefix_content, 0,
> sizeof(buf_prefix_content));
>   1068
>   1069          buf_prefix_content.priv_data_size = buf_layout-
> >priv_data_size;
>   1070          buf_prefix_content.pass_prs_result = true;
>   1071          buf_prefix_content.pass_hash_result = true;
>   1072          buf_prefix_content.pass_time_stamp = false;
>   1073          buf_prefix_content.data_align = DPAA_FD_DATA_ALIGNMENT;
>   1074
>   1075          params.specific_params.non_rx_params.err_fqid = errq-
> >fqid;
>   1076          params.specific_params.non_rx_params.dflt_fqid = defq-
> >fqid;
>   1077
>   1078          err = fman_port_config(port, &params);
> 
> fman_port_config() frees port on error.  This is the wrong thing to do
> and a layering violation.  We should just return an error.
> 
> But the callers also need to be modified to check for errors etc...  So
> it's not easy to fix all the bugs because there are too many.
> 
>   1079          if (err)
>   1080                  pr_err("%s: fman_port_config failed\n", __func__);
>   1081
>   1082          err = fman_port_cfg_buf_prefix_content(port,
> &buf_prefix_content);
> 
> Use after free.
> 
>   1083          if (err)
>   1084                  pr_err("%s: fman_port_cfg_buf_prefix_content
> failed\n",
>   1085                         __func__);
>   1086
>   1087          err = fman_port_init(port);
>   1088          if (err)
>   1089                  pr_err("%s: fm_port_init failed\n", __func__);
>   1090  }
> 
> 
> regards,
> dan carpenter


Thanks Dan,
I will look into these problems and will try to address them.

Madalin
