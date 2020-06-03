From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jun 2020 17:31:25 +0000
Subject: Re: [PATCH][V2] input: ims-pcu: return error code rather than -ENOMEM
Message-Id: <20200603173125.GN30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603152151.139337-1-colin.king@canonical.com>
In-Reply-To: <20200603152151.139337-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 03, 2020 at 04:21:51PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the assignment of -ENOMEM to error is redudant because error
> is not being read and -ENOMEM is being hard coded as an error return.
> Fix this by returning the error code in variable 'error'; this also
> allows the error code from a failed call to input_register_device to
> be preserved and returned to the caller rather than just returning
> a possibly inappropriate -ENOMEM.
> 
> Kudos to Dan Carpenter for the suggestion of an improved fix.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
