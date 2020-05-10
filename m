From: Jakub Kicinski <kuba@kernel.org>
Date: Sun, 10 May 2020 18:14:36 +0000
Subject: Re: [PATCH] net: usb: qmi_wwan: remove redundant assignment to variable status
Message-Id: <20200510111436.66d8838f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509215756.506840-1-colin.king@canonical.com>
        <20200509215756.506840-2-colin.king@canonical.com>
In-Reply-To: <20200509215756.506840-2-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat,  9 May 2020 22:57:56 +0100 Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable status is being initializeed with a value that is never read
> and it is being updated later with a new value. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied the 3 fixes from Saturday to net-next, thanks.
