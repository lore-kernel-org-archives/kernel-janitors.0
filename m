From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 May 2015 08:14:17 +0000
Subject: Re: type mismatch
Message-Id: <20150511081417.GH14154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1505101517100.2645@hadrien>
In-Reply-To: <alpine.DEB.2.10.1505101517100.2645@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hm...  You're right.  I'm going to retract some things.

1) I didn't end up adding a special case handling for this, I only
   wanted to but never got around to it.

2) Also these aren't *that* common as I was thinking.  They're mostly
   limitted to emulex.

drivers/net/ethernet/emulex/benet/be_cmds.c
  3173  
  3174          be_wrb_cmd_hdr_prepare(&req->hdr, CMD_SUBSYSTEM_COMMON,
                                       ^^^^^^^^^
First element.

  3175                                 OPCODE_COMMON_SET_HSW_CONFIG, sizeof(*req), wrb,
                                                                     ^^^^^^^^^^^^
Here is the sizeof().

  3176                                 NULL);
  3177  

3) It's also obvious why emulex would do this because the req struct
   could be defined a lot of different ways so long as the first element
   is a header.  It's like a union.

Sorry for the misinformation.  My bad.

regards,
dan carpenter

