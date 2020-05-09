From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 May 2020 10:51:20 +0000
Subject: Re: [PATCH] cnic: remove redundant assignment to variable ret
Message-Id: <20200509105120.GH9365@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508224026.483746-1-colin.king@canonical.com>
In-Reply-To: <20200508224026.483746-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 08, 2020 at 11:40:26PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being assigned with a value that is never read,
> the assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

We used to return negative error codes until commit 23021c21055f ("cnic:
Improve error recovery on bnx2x devices").

To be honest, I like the deliberate "ret = 0;" because this code will
trigger a static checker warning about wrong error codes.  Also it looks
wrong to human reviewers.  We should probably add a comment:

	/* Deliberately returning success */
	return 0;

regards,
dan carpenter
