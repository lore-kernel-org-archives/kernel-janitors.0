From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Aug 2018 12:41:51 +0000
Subject: [bug report] tools: usb: aio example applications
Message-Id: <20180807124151.pnqkga7e5blerl3j@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Robert Baldyga,

The patch b34e08d5c706: "tools: usb: aio example applications" from
Feb 11, 2014, leads to the following static checker warning:

	./tools/usb/ffs-aio-example/multibuff/device_app/aio_multibuff.c:320 main()
	error: uninitialized symbol 'ready'.

./tools/usb/ffs-aio-example/multibuff/device_app/aio_multibuff.c
   286          memset(&ctx, 0, sizeof(ctx));
   287          /* setup aio context to handle up to AIO_MAX requests */
   288          if (io_setup(AIO_MAX, &ctx) < 0) {
   289                  perror("unable to setup aio");
   290                  return 1;
   291          }
   292  
   293          evfd = eventfd(0, 0);
   294          if (evfd < 0) {
   295                  perror("unable to open eventfd");
   296                  return 1;
   297          }
   298  
   299          for (i = 0; i < sizeof(iobuf)/sizeof(*iobuf); ++i)
   300                  init_bufs(&iobuf[i], BUFS_MAX, BUF_LEN);
   301  
   302          while (1) {
   303                  FD_ZERO(&rfds);
   304                  FD_SET(ep0, &rfds);
   305                  FD_SET(evfd, &rfds);
   306  
   307                  ret = select(((ep0 > evfd) ? ep0 : evfd)+1,
   308                               &rfds, NULL, NULL, NULL);
   309                  if (ret < 0) {
   310                          if (errno = EINTR)
   311                                  continue;
   312                          perror("select");
   313                          break;
   314                  }
   315  
   316                  if (FD_ISSET(ep0, &rfds))
   317                          handle_ep0(ep0, &ready);
                                                ^^^^^^
Are we garuanteed that FD_ISSET() on the first iteration?

   318  
   319                  /* we are waiting for function ENABLE */
   320                  if (!ready)
                             ^^^^^
Otherwise this could be uninitialized

   321                          continue;

regards,
dan carpenter
