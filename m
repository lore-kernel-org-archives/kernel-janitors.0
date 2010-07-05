From: Dan Carpenter <error27@gmail.com>
Date: Mon, 05 Jul 2010 20:48:53 +0000
Subject: Re: ERROR: do not initialise externals to 0 or NULL
Message-Id: <20100705204853.GB19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278346615.5396.3.camel@dermezel>
In-Reply-To: <1278346615.5396.3.camel@dermezel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 05, 2010 at 10:45:20PM +0200, Dan Carpenter wrote:
> /* Error variable.  Zero means no error. */
> int dt3155_errno;
> 
> But really this global variable is pretty ugly.  It would be better to
> eliminate it.  You would have to modify wait_ibsyclr() somehow...
> 

The variable gets assigned but never used.  Maybe try figure out if that
means there is a larger bug, otherwise you can just removed it entirely.

> regards,
> dan carpenter
