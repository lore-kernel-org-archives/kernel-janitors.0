From: Dan Carpenter <error27@gmail.com>
Date: Tue, 02 Mar 2010 08:21:35 +0000
Subject: bug report: sd:  off by one in sd_read_block_limits()
Message-Id: <20100302082135.GA6218@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

drivers/scsi/sd.c +1986 sd_read_block_limits(39) warn: buffer overflow 'buffer' 32 <= 32
  1951          const int vpd_len = 32;
  1952          unsigned char *buffer = kmalloc(vpd_len, GFP_KERNEL);

	[snip]

  1984                  if (buffer[32] & 0x80)

	This is past the end of the array.

  1985                          q->limits.discard_alignment   1986                                  get_unaligned_be32(&buffer[32]) & ~(1 << 31);
  1987          }

regards,
dan carpenter
