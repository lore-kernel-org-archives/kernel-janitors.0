From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Mar 2019 15:32:52 +0000
Subject: [bug report] mlxsw: cmd: Handle error after reset gracefully
Message-Id: <20190305153251.GA15886@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jiri Pirko,

The patch 2a360bf0f660: "mlxsw: cmd: Handle error after reset
gracefully" from May 27, 2018, leads to the following static checker
warning:

	drivers/net/ethernet/mellanox/mlxsw/core.c:1858 mlxsw_cmd_exec()
	error: uninitialized symbol 'status'.

drivers/net/ethernet/mellanox/mlxsw/core.c
  1828  int mlxsw_cmd_exec(struct mlxsw_core *mlxsw_core, u16 opcode, u8 opcode_mod,
  1829                     u32 in_mod, bool out_mbox_direct, bool reset_ok,
  1830                     char *in_mbox, size_t in_mbox_size,
  1831                     char *out_mbox, size_t out_mbox_size)
  1832  {
  1833          u8 status;
  1834          int err;
  1835  
  1836          BUG_ON(in_mbox_size % sizeof(u32) || out_mbox_size % sizeof(u32));
  1837          if (!mlxsw_core->bus->cmd_exec)
  1838                  return -EOPNOTSUPP;
  1839  
  1840          dev_dbg(mlxsw_core->bus_info->dev, "Cmd exec (opcode=%x(%s),opcode_mod=%x,in_mod=%x)\n",
  1841                  opcode, mlxsw_cmd_opcode_str(opcode), opcode_mod, in_mod);
  1842          if (in_mbox) {
  1843                  dev_dbg(mlxsw_core->bus_info->dev, "Input mailbox:\n");
  1844                  mlxsw_core_buf_dump_dbg(mlxsw_core, in_mbox, in_mbox_size);
  1845          }
  1846  
  1847          err = mlxsw_core->bus->cmd_exec(mlxsw_core->bus_priv, opcode,
  1848                                          opcode_mod, in_mod, out_mbox_direct,
  1849                                          in_mbox, in_mbox_size,
  1850                                          out_mbox, out_mbox_size, &status);


mlxsw_i2c_cmd_exec() can return -EIO without initializing &status.

  1851  
  1852          if (!err && out_mbox) {
  1853                  dev_dbg(mlxsw_core->bus_info->dev, "Output mailbox:\n");
  1854                  mlxsw_core_buf_dump_dbg(mlxsw_core, out_mbox, out_mbox_size);
  1855          }
  1856  
  1857          if (reset_ok && err = -EIO &&
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
  1858              status = MLXSW_CMD_STATUS_RUNNING_RESET) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  1859                  err = 0;
  1860          } else if (err = -EIO && status != MLXSW_CMD_STATUS_OK) {
  1861                  dev_err(mlxsw_core->bus_info->dev, "Cmd exec failed (opcode=%x(%s),opcode_mod=%x,in_mod=%x,status=%x(%s))\n",
  1862                          opcode, mlxsw_cmd_opcode_str(opcode), opcode_mod,
  1863                          in_mod, status, mlxsw_cmd_status_str(status));
  1864          } else if (err = -ETIMEDOUT) {
  1865                  dev_err(mlxsw_core->bus_info->dev, "Cmd exec timed-out (opcode=%x(%s),opcode_mod=%x,in_mod=%x)\n",
  1866                          opcode, mlxsw_cmd_opcode_str(opcode), opcode_mod,
  1867                          in_mod);
  1868          }
  1869  
  1870          return err;
  1871  }

regards,
dan carpenter
