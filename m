From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Feb 2015 11:04:41 +0000
Subject: Re: [PATCH 1/1] staging: ozwpan: Move code from success handling to error handling
Message-Id: <20150210110441.GH5206@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150210104208.GA16539@sloth>
In-Reply-To: <20150210104208.GA16539@sloth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Shigekatsu Tateno <shigekatsu.tateno@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 10, 2015 at 11:42:08AM +0100, Quentin Lambert wrote:
> The original version was success handling rather than error handling,
> therefore this patch reduces nesting.
> 
> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>

Fantastic.  :)  Thanks!

regards,
dan carpenter

