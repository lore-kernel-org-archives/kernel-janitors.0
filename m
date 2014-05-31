From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 31 May 2014 21:17:19 +0000
Subject: Re: [PATCH 1/11] USB: kl5kusb105: Remove useless return variables
Message-Id: <538A46DF.1040009@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401542051-3174-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1401542051-3174-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>, Oliver Neukum <oliver@neukum.org>
Cc: kernel-janitors@vger.kernel.org, Johan Hovold <jhovold@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Hello.

On 05/31/2014 05:14 PM, Peter Senna Tschudin wrote:

> This patch remove variables that are initialized with a constant,
> are never updated, and are only used as parameter of return.
> Return the constant instead of using a variable.

   The patch does more than just that, it also removes commented out code.

> Verified by compilation only.

[...]

> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

WBR, Sergei


