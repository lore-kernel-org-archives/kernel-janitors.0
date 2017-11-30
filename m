From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Nov 2017 14:36:09 +0000
Subject: Re: [bug report] mlxsw: spectrum: Support decap-only IP-in-IP tunnels
Message-Id: <20171130143609.xphsibczokll4vqr@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171130101024.qapgjcaeuefxy5da@mwanda>
In-Reply-To: <20171130101024.qapgjcaeuefxy5da@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Nov 30, 2017 at 03:33:32PM +0200, Petr Machata wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > Hello Petr Machata,
> >
> > The patch 0063587d3587: "mlxsw: spectrum: Support decap-only IP-in-IP
> > tunnels" from Oct 16, 2017, leads to the following static checker
> > warning:
> >
> > 	drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:1306 mlxsw_sp_netdevice_ipip_ol_reg_event()
> > 	error: uninitialized symbol 'ipipt'.
> >
> > drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> >   1296  static int mlxsw_sp_netdevice_ipip_ol_reg_event(struct mlxsw_sp *mlxsw_sp,
> >   1297                                                  struct net_device *ol_dev)
> >   1298  {
> >   1299          struct mlxsw_sp_ipip_entry *ipip_entry;
> >   1300          enum mlxsw_sp_l3proto ul_proto;
> >   1301          enum mlxsw_sp_ipip_type ipipt;
> >   1302          union mlxsw_sp_l3addr saddr;
> >   1303          u32 ul_tb_id;
> >   1304  
> >   1305          mlxsw_sp_netdev_ipip_type(mlxsw_sp, ol_dev, &ipipt);
> >                                                              ^^^^^
> > Not initialized on error path.
> 
> That's a "can't happen" scenario. That's the reason I'm not checking
> return code from mlxsw_sp_netdev_ipip_type--we won't get there unless
> it's safe to call it.
> 
> How should this be handled? I can make it a WARN_ON type of thing, but
> my impression was that function contracts are not checked like this in
> the kernel. (E.g. mlxsw_sp is not checked for not-NULLness.)

Ah.  I see how it's checked now in mlxsw_sp_netdevice_event().  Just
ignore the warning.  I'm pretty sure that eventually I will be able to
teach Smatch to follow that code.

regards,
dan carpenter

