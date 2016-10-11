From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Oct 2016 11:08:40 +0000
Subject: [bug report] orangefs: clean up debugfs globals
Message-Id: <20161011110840.GA7666@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Martin Brandenburg,

The patch 44f4641073f1: "orangefs: clean up debugfs globals" from Aug
15, 2016, leads to the following static checker warning:

	fs/orangefs/orangefs-debugfs.c:1003 orangefs_debugfs_new_client_string()
	warn: passing freed memory 'debug_help_string'

fs/orangefs/orangefs-debugfs.c
   984          pr_info("%s: client debug array string has been received.\n",
   985                  __func__);
   986  
   987          if (!help_string_initialized) {
   988  
   989                  /* Free the "we don't know yet" default string... */
   990                  kfree(debug_help_string);

This can be a double free.

   991  
   992                  /* build a proper debug help string */
   993                  if (orangefs_prepare_debugfs_help_string(0)) {

Let's imagine this fails without modifying debug_help_string and we call
the function again.  It probably doesn't affect real life, but this is
quite ugly.

   994                          gossip_err("%s: no debug help string \n",
   995                                     __func__);
   996                          return -EIO;
   997                  }
   998  
   999                  /* Replace the boilerplate boot-time debug-help file. */
  1000                  debugfs_remove(help_file_dentry);
  1001  
  1002                  help_file_dentry   1003                          debugfs_create_file(
  1004                                  ORANGEFS_KMOD_DEBUG_HELP_FILE,
  1005                                  0444,
  1006                                  debug_dir,
  1007                                  debug_help_string,
  1008                                  &debug_help_fops);
  1009  
  1010                  if (!help_file_dentry) {
  1011                          gossip_err("%s: debugfs_create_file failed for"
  1012                                     " :%s:!\n",
  1013                                     __func__,
  1014                                     ORANGEFS_KMOD_DEBUG_HELP_FILE);
  1015                          return -EIO;
  1016                  }
  1017          }

regards,
dan carpenter
