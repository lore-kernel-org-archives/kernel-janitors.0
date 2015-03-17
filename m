From: Daniel Mack <daniel@zonque.org>
Date: Tue, 17 Mar 2015 18:49:38 +0000
Subject: Re: kdbus: add connection, queue handling and message validation code
Message-Id: <55087742.5020103@zonque.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150317182932.GB30354@mwanda>
In-Reply-To: <20150317182932.GB30354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On 03/17/2015 07:29 PM, Dan Carpenter wrote:
> Hello Daniel Mack,
> 
> The patch 5fc8dd5c84fc: "kdbus: add connection, queue handling and
> message validation code" from Sep 11, 2014, leads to the following
> static checker warning:
> 
> 	ipc/kdbus/connection.c:2000 kdbus_cmd_send()
> 	warn: 'cancel_fd' isn't an ERR_PTR
> 
> ipc/kdbus/connection.c
>   1998          if (argv[1].item) {
>   1999                  cancel_fd = fget(argv[1].item->fds[0]);
>                                     ^^^^
> fget() returns NULL on error.

Thanks for reporting this! Should be fixed with the patch I just sent out.


Best regards,
Daniel

