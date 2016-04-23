From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 23 Apr 2016 10:28:26 +0000
Subject: Re: tracing: Add 'hist' event trigger command
Message-Id: <20160423102826.GE17913@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160422095423.GA11398@mwanda>
In-Reply-To: <20160422095423.GA11398@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 22, 2016 at 10:14:30AM -0500, Tom Zanussi wrote:
> Hi Dan,
> 
> Thanks for flagging this, but I don't think it's really a problem in
> this case - the cases where field could be NULL are checked and the
> function exits before is_string_field() is called.
> 

It's likely that I will be able to silence that false positive in Smatch
sometime before the end of the year.

regards,
dan carpenter

