From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Jul 2017 10:19:28 +0000
Subject: [bug report] isofs: Implement show_options
Message-Id: <20170711101927.2d7cy5zlpxfby6eh@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello David Howells,

The patch 6fecb86a44f5: "isofs: Implement show_options" from Jul 5,
2017, leads to the following static checker warning:

	fs/isofs/inode.c:495 isofs_show_options()
	warn: always true condition '(sbi->s_session != -1) => (0-255 != (-1))'

fs/isofs/inode.c
   480  static int isofs_show_options(struct seq_file *m, struct dentry *root)
   481  {
   482          struct isofs_sb_info *sbi = ISOFS_SB(root->d_sb);
   483  
   484          if (!sbi->s_rock)               seq_puts(m, ",norock");
   485          else if (!sbi->s_joliet_level)  seq_puts(m, ",nojoliet");
   486          if (sbi->s_cruft)               seq_puts(m, ",cruft");
   487          if (sbi->s_hide)                seq_puts(m, ",hide");
   488          if (sbi->s_nocompress)          seq_puts(m, ",nocompress");
   489          if (sbi->s_overriderockperm)    seq_puts(m, ",overriderockperm");
   490          if (sbi->s_showassoc)           seq_puts(m, ",showassoc");
   491          if (sbi->s_utf8)                seq_puts(m, ",utf8");
   492  
   493          if (sbi->s_check)               seq_printf(m, ",check=%c", sbi->s_check);
   494          if (sbi->s_mapping)             seq_printf(m, ",map=%c", sbi->s_mapping);
   495          if (sbi->s_session != -1)       seq_printf(m, ",session=%u", sbi->s_session);
                    ^^^^^^^^^^^^^^^^^^^^
->s_session is a u8 so it can't be -1

   496          if (sbi->s_sbsector != -1)      seq_printf(m, ",sbsector=%u", sbi->s_sbsector);
   497  

regards,
dan carpenter
