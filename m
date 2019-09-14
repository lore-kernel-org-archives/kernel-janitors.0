From: Rohit Sarkar <rohitsarkar5398@gmail.com>
Date: Sat, 14 Sep 2019 06:43:36 +0000
Subject: Re: Problems during compiling in kernel modules
Message-Id: <20190914063136.GA23166@SARKAR>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190913173821.GA5986@SARKAR>
 <20190913180103.GB5986@SARKAR>
 <ff4b5c99-086b-4456-fb2b-643a6caefcee@infradead.org>
In-Reply-To: <ff4b5c99-086b-4456-fb2b-643a6caefcee@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org

On Fri, Sep 13, 2019 at 03:36:03PM -0700, Randy Dunlap wrote:
> Hi,
> It works for me.  Do you have a kernel .config file?
> Does it set/enable CONFIG_IIO and some/any/all drivers in drivers/iio/accel/ ?
> 
> If you don't have a kernel .config file, I don't expect it to work.
> -- 
> ~Randy

Hey Randy,
I do have a .config file but no it does not set "CONFIG_IIO".
The weird thing is when I built the kernel initially the object files
for drivers/iio/accel/ were generated. 
That's strange right?

Thanks for helping!

Rohit
