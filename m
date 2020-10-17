From: Guenter Roeck <linux@roeck-us.net>
Date: Sat, 17 Oct 2020 01:25:45 +0000
Subject: Re: [PATCH] hwmon: (acpi_power_meter) clean up freeing code
Message-Id: <20201017012545.GA195203@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201007075148.GB2529578@mwanda>
In-Reply-To: <20201007075148.GB2529578@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 07, 2020 at 10:51:48AM +0300, Dan Carpenter wrote:
> This code works okay but Smatch flagged it as a double free.  I've
> changed three things to make it more clear.  1)  Remove the call to
> free_capabilities() in acpi_power_meter_add().  This call is a no-op
> because the capabilities have not been allocated yet.  2)  Set "*str" to
> NULL in free_capabilities() so that way the function can be called twice
> in a row without leading to a double free.  3)  Call free_capabilities()
> in read_capabilities() instead of open coding the free.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hmm, somehow this patch slipped throigh the cracks.
Sorry for that. Applied.

Thanks,
Guenter
