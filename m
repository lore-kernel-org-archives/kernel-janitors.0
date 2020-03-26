From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 26 Mar 2020 13:04:18 +0000
Subject: Re: [RFC PATCH] usb: cdns3: cdns3_clear_register_bit() can be static
Message-Id: <20200326130418.GA1295433@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200325125041.94769-1-colin.king@canonical.com>
 <20200326122858.GA50118@cde5a4ed3207>
In-Reply-To: <20200326122858.GA50118@cde5a4ed3207>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kbuild test robot <lkp@intel.com>
Cc: Colin King <colin.king@canonical.com>, kbuild-all@lists.01.org, Sekhar Nori <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 26, 2020 at 08:28:58PM +0800, kbuild test robot wrote:
> 
> Fixes: 87db1192dc33 ("usb: cdns3: make signed 1 bit bitfields unsigned")

This original patch did not "cause" this problem, it's just that you for
some reason ran sparse for the first time on the file.

So I can't take this as-is, can you remove this line and resend?

thanks,

greg k-h
