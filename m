From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Sep 2019 09:08:44 +0000
Subject: [bug report] net/mlx5: Add direct rule fs_cmd implementation
Message-Id: <20190905090844.GA16180@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Maor Gottlieb,

The patch 6a48faeeca10: "net/mlx5: Add direct rule fs_cmd
implementation" from Aug 20, 2019, leads to the following static
checker warning:

	drivers/net/ethernet/mellanox/mlx5/core/steering/fs_dr.c:52 set_miss_action()
	warn: 'action' was already freed.

drivers/net/ethernet/mellanox/mlx5/core/steering/fs_dr.c
    27  static int set_miss_action(struct mlx5_flow_root_namespace *ns,
    28                             struct mlx5_flow_table *ft,
    29                             struct mlx5_flow_table *next_ft)
    30  {
    31          struct mlx5dr_action *old_miss_action;
    32          struct mlx5dr_action *action = NULL;
    33          struct mlx5dr_table *next_tbl;
    34          int err;
    35  
    36          next_tbl = next_ft ? next_ft->fs_dr_table.dr_table : NULL;
    37          if (next_tbl) {
    38                  action = mlx5dr_action_create_dest_table(next_tbl);
    39                  if (!action)
    40                          return -EINVAL;
    41          }
    42          old_miss_action = ft->fs_dr_table.miss_action;
    43          err = mlx5dr_table_set_miss_action(ft->fs_dr_table.dr_table, action);
    44          if (err && action) {
    45                  err = mlx5dr_action_destroy(action);
                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If err returns -EBUSY then "action" is not freed but if it returns zero
that means it is freed.

    46                  if (err) {
    47                          action = NULL;
    48                          mlx5_core_err(ns->dev, "Failed to destroy action (%d)\n",
    49                                        err);
    50                  }
    51          }
    52          ft->fs_dr_table.miss_action = action;
                                              ^^^^^^
Use after free.

    53          if (old_miss_action) {
    54                  err = mlx5dr_action_destroy(old_miss_action);
    55                  if (err)
    56                          mlx5_core_err(ns->dev, "Failed to destroy action (%d)\n",
    57                                        err);
    58          }
    59  
    60          return err;
    61  }

regards,
dan carpenter
