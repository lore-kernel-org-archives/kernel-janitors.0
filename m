From: Ian Abbott <abbotti@mev.co.uk>
Date: Fri, 22 Feb 2013 15:36:45 +0000
Subject: Re: [PATCH v2] staging: comedi: drivers: usbduxsigma.c: fix DMA buffers on stack
Message-Id: <5127908D.5020301@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1361513228-8897-1-git-send-email-gmate.amit@gmail.com> <51274244.6080507@mev.co.uk> <20130222142619.GA11141@gmail.com>
In-Reply-To: <20130222142619.GA11141@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar amit mehta <gmate.amit@gmail.com>
Cc: Ian Abbott <ian.abbott@mev.co.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "fmhess@users.sourceforge.net" <fmhess@users.sourceforge.net>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 2013-02-22 14:26, Kumar amit mehta wrote:
> On Fri, Feb 22, 2013 at 10:02:44AM +0000, Ian Abbott wrote:
>> On 2013-02-22 06:07, Kumar Amit Mehta wrote:
>>> This patch fixes an instance of DMA buffer on stack(being passed to
>>> usb_control_msg)for the USB-DUXsigma Board driver. Found using smatch.
>>>
>>
>> Looks good here too.
>>
>> Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
>>
>> Would you mind doing the same for usbdux.c and usbduxfast.c?
> Sure.
> As pointed out by Dan, Do you really want the buffer to be of 16 bytes, as we
> are using only the first byte and passing the length as '1' in:
> usbduxsub_start, usbduxsub_stop, usbduxfastsub_start, usbduxfastsub_stop ?

A buffer size of 1 should be fine.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
