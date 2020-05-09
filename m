From: Michael Chan <michael.chan@broadcom.com>
Date: Sat, 09 May 2020 04:50:01 +0000
Subject: Re: [PATCH] cnic: remove redundant assignment to variable ret
Message-Id: <CACKFLinBL4QCT6YcTn=exkHAitXHd_D_XR0zHwT1zuMfKTyWug@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508224026.483746-1-colin.king@canonical.com>
In-Reply-To: <20200508224026.483746-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Fri, May 8, 2020 at 3:40 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being assigned with a value that is never read,
> the assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Michael Chan <michael.chan@broadcom.com>
