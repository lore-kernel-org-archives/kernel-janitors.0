From: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 05 Dec 2017 16:17:59 +0000
Subject: Re: [PATCH] hwmon: (w83773g) Fix a precedence bug in get_fault()
Message-Id: <20171205161759.GB12347@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143726.d3tziwhjboyfxmgi@mwanda>
In-Reply-To: <20171205143726.d3tziwhjboyfxmgi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, Lei YU <mine260309@gmail.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 05, 2017 at 05:37:26PM +0300, Dan Carpenter wrote:
> Shift has higher precedence than mask but presumably we wanted to set
> *val to 1 if BIT(2) was set or 0 if the bit was clear.
> 
> Fixes: de0a524e3e09 ("hwmon: Add W83773G driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hi Dan,

I already queued up the fix after my own builders reported the problem.

Thanks,
Guenter
