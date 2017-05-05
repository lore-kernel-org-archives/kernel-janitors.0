From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Fri, 05 May 2017 07:46:05 +0000
Subject: Re: [PATCH] cxl: Unlock on error in probe
Message-Id: <c275cb27-e31c-78a8-3672-85014b9c7776@au1.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170505053622.0670F124037@b01ledav002.gho.pok.ibm.com>
 <a4c0a3f6-f631-0998-ddd0-ca2efd4f1bfd@au1.ibm.com>
 <20170505073800.4F753124037@b01ledav002.gho.pok.ibm.com>
In-Reply-To: <20170505073800.4F753124037@b01ledav002.gho.pok.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ian Munsie <imunsie@au1.ibm.com>, Christophe Lombard <clombard@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>

On 05/05/17 17:37, Dan Carpenter wrote:
> On Fri, May 05, 2017 at 05:14:15PM +1000, Andrew Donnellan wrote:
>> sem is a global and it looks like it's intended to be held after
>> device_open() returns and only released in device_close(), so this looks
>> wrong.
>>
>
> This doesn't affect the success path, it only means that if
> device_open() fails because we don't have enough free memory or whatever
> then we can try again later.

Argh, I completely missed the "return 0" above err1 and thought the 
success path fell through. My mistake, that's what I get for trying to 
review patches after staring at hardware simulation logs all day...

In that case, the patch looks fine to me.

Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

