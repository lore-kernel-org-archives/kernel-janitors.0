From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 06 Aug 2020 22:35:25 +0000
Subject: Re: [PATCH] input: alps: remove redundant assignment to variable ret
Message-Id: <20200806223525.GL1665100@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603135742.130852-1-colin.king@canonical.com>
In-Reply-To: <20200603135742.130852-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 03, 2020 at 02:57:42PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.

-- 
Dmitry
