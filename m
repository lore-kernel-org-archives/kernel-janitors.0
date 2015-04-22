From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Apr 2015 13:38:25 +0000
Subject: re: kdbus: add name registry implementation
Message-Id: <20150422133825.GA29383@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Daniel,

The patch 29dc02b6af35: "kdbus: add name registry implementation"
from Sep 11, 2014, has a potential issue:

ipc/kdbus/names.c
   697  /**
   698   * kdbus_cmd_list() - handle KDBUS_CMD_LIST
   699   * @conn:               connection to operate on
   700   * @argp:               command payload
   701   *
   702   * Return: 0 on success, negative error code on failure.
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We're supposed to return negative on failure.

   703   */
   704  int kdbus_cmd_list(struct kdbus_conn *conn, void __user *argp)
   705  {
   706          struct kdbus_name_registry *reg = conn->ep->bus->name_registry;
   707          struct kdbus_pool_slice *slice = NULL;
   708          struct kdbus_cmd_list *cmd;
   709          size_t pos, size;
   710          int ret;
   711  
   712          struct kdbus_arg argv[] = {
   713                  { .type = KDBUS_ITEM_NEGOTIATE },
   714          };
   715          struct kdbus_args args = {
   716                  .allowed_flags = KDBUS_FLAG_NEGOTIATE |


We allow KDBUS_FLAG_NEGOTIATE.

   717                                   KDBUS_LIST_UNIQUE |
   718                                   KDBUS_LIST_NAMES |
   719                                   KDBUS_LIST_ACTIVATORS |
   720                                   KDBUS_LIST_QUEUED,
   721                  .argv = argv,
   722                  .argc = ARRAY_SIZE(argv),
   723          };
   724  
   725          ret = kdbus_args_parse(&args, argp, &cmd);
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We means this can return 1, I think.  I picked this call at random but
it seems like some of other the places which call kdbus_args_parse()
might have an issue here as well.  This might be obvious to someone more
familiar with kdbus code.

   726          if (ret != 0)
   727                  return ret;
   728  

regards,
dan carpenter
