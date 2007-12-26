From: "H. Peter Anvin" <hpa@zytor.com>
Date: Wed, 26 Dec 2007 17:48:35 +0000
Subject: Re: [PATCH 1/4] fs/autofs: Use time_before, time_before_eq, etc.
Message-Id: <477293F3.60304@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0712261621000.1185@pc-041.diku.dk>
In-Reply-To: <Pine.LNX.4.58.0712261621000.1185@pc-041.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: autofs@linux.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The functions time_before, time_before_eq, time_after, and time_after_eq
> are more robust for comparing jiffies against other values.
> 

More robust, how?  You already almost introduced a bug here...

	-hpa
