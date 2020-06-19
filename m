From: Ido Schimmel <idosch@mellanox.com>
Date: Fri, 19 Jun 2020 13:01:47 +0000
Subject: Re: [bug report] mlxsw: spectrum: Adjust headroom buffers for 8x ports
Message-Id: <20200619130147.GA400150@splinter>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200619100907.GA246319@mwanda>
In-Reply-To: <20200619100907.GA246319@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jun 19, 2020 at 01:09:07PM +0300, Dan Carpenter wrote:
> Hello Ido Schimmel,
> 
> The patch 60833d54d56c: "mlxsw: spectrum: Adjust headroom buffers for
> 8x ports" from Jun 16, 2020, leads to the following static checker
> warning:

Thanks for the report, Dan.

Colin already reported it to me and I have the below patch in my queue
to address the issue. WDYT?

commit 7f3da2eeb1011ce4117ad75df91dc0b16b7b561b
Author: Ido Schimmel <idosch@mellanox.com>
Date:   Thu Jun 18 18:14:04 2020 +0300

    mlxsw: spectrum: Do not rely on machine endianness
    
    The second commit cited below performed a cast of 'u32 buffsize' to
    '(u16 *)' when calling mlxsw_sp_port_headroom_8x_adjust():
    
    mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, (u16 *) &buffsize);
    
    Colin noted that this will behave differently on big endian
    architectures compared to little endian architectures.
    
    Fix this by following Colin's suggestion and have the function accept
    and return 'u32' instead of passing the current size by reference.
    
    Fixes: da382875c616 ("mlxsw: spectrum: Extend to support Spectrum-3 ASIC")
    Fixes: 60833d54d56c ("mlxsw: spectrum: Adjust headroom buffers for 8x ports")
    Signed-off-by: Ido Schimmel <idosch@mellanox.com>
    Reported-by: Colin Ian King <colin.king@canonical.com>
    Suggested-by: Colin Ian King <colin.king@canonical.com>

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
index 55af877763ed..029ea344ad65 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
@@ -978,10 +978,10 @@ int __mlxsw_sp_port_headroom_set(struct mlxsw_sp_port *mlxsw_sp_port, int mtu,
 
 		lossy = !(pfc || pause_en);
 		thres_cells = mlxsw_sp_pg_buf_threshold_get(mlxsw_sp, mtu);
-		mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, &thres_cells);
+		thres_cells = mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, thres_cells);
 		delay_cells = mlxsw_sp_pg_buf_delay_get(mlxsw_sp, mtu, delay,
 							pfc, pause_en);
-		mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, &delay_cells);
+		delay_cells = mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, delay_cells);
 		total_cells = thres_cells + delay_cells;
 
 		taken_headroom_cells += total_cells;
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.h b/drivers/net/ethernet/mellanox/mlxsw/spectrum.h
index 6e87457dd635..3abe3e7d89bc 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.h
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.h
@@ -374,17 +374,15 @@ mlxsw_sp_port_vlan_find_by_vid(const struct mlxsw_sp_port *mlxsw_sp_port,
 	return NULL;
 }
 
-static inline void
+static inline u32
 mlxsw_sp_port_headroom_8x_adjust(const struct mlxsw_sp_port *mlxsw_sp_port,
-				 u16 *p_size)
+				 u32 size_cells)
 {
 	/* Ports with eight lanes use two headroom buffers between which the
 	 * configured headroom size is split. Therefore, multiply the calculated
 	 * headroom size by two.
 	 */
-	if (mlxsw_sp_port->mapping.width != 8)
-		return;
-	*p_size *= 2;
+	return mlxsw_sp_port->mapping.width = 8 ? 2 * size_cells : size_cells;
 }
 
 enum mlxsw_sp_flood_type {
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_buffers.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_buffers.c
index f25a8b084b4b..6f84557a5a6f 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_buffers.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_buffers.c
@@ -312,7 +312,7 @@ static int mlxsw_sp_port_pb_init(struct mlxsw_sp_port *mlxsw_sp_port)
 
 		if (i = MLXSW_SP_PB_UNUSED)
 			continue;
-		mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, &size);
+		size = mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, size);
 		mlxsw_reg_pbmc_lossy_buffer_pack(pbmc_pl, i, size);
 	}
 	mlxsw_reg_pbmc_lossy_buffer_pack(pbmc_pl,
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
index f843545d3478..92351a79addc 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
@@ -782,7 +782,7 @@ mlxsw_sp_span_port_buffer_update(struct mlxsw_sp_port *mlxsw_sp_port, u16 mtu)
 		speed = 0;
 
 	buffsize = mlxsw_sp_span_buffsize_get(mlxsw_sp, speed, mtu);
-	mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, (u16 *) &buffsize);
+	buffsize = mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, buffsize);
 	mlxsw_reg_sbib_pack(sbib_pl, mlxsw_sp_port->local_port, buffsize);
 	return mlxsw_reg_write(mlxsw_sp->core, MLXSW_REG(sbib), sbib_pl);
 }
