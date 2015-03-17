From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Mar 2015 18:29:32 +0000
Subject: re: kdbus: add connection, queue handling and message validation code
Message-Id: <20150317182932.GB30354@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Daniel Mack,

The patch 5fc8dd5c84fc: "kdbus: add connection, queue handling and
message validation code" from Sep 11, 2014, leads to the following
static checker warning:

	ipc/kdbus/connection.c:2000 kdbus_cmd_send()
	warn: 'cancel_fd' isn't an ERR_PTR

ipc/kdbus/connection.c
  1998          if (argv[1].item) {
  1999                  cancel_fd = fget(argv[1].item->fds[0]);
                                    ^^^^
fget() returns NULL on error.

  2000                  if (IS_ERR(cancel_fd)) {
  2001                          ret = PTR_ERR(cancel_fd);
  2002                          cancel_fd = NULL;
  2003                          goto exit;
  2004                  }
  2005  
  2006                  if (!cancel_fd->f_op->poll) {
  2007                          ret = -EINVAL;
  2008                          goto exit;
  2009                  }
  2010          }

regards,
dan carpenter
