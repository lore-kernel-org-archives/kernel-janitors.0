From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 May 2012 15:53:15 +0000
Subject: Re: [patch 1/2] Staging: ipack: returning a freed pointer
Message-Id: <20120510155315.GV22134@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120510151836.GA31515@elgon.mountain>
In-Reply-To: <20120510151836.GA31515@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 10, 2012 at 05:33:55PM +0200, walter harms wrote:
> >  	if (size > IPACK_BOARD_NAME_SIZE) {
> 
> I can not see the rest, is "size" handelt correct here ?
> or is size >= IPACK_BOARD_NAME_SIZE intended ?

Yeah.  size = IPACK_BOARD_NAME_SIZE is fine.

regards,
dan carpenter

