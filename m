From: Sohny Thomas <sohnythomas@zoho.com>
Date: Wed, 01 Jul 2015 08:46:48 +0000
Subject: Re: [PATCH] Staging: unisys: virtpci: fixed a brace coding style issue
Message-Id: <5593A628.1060008@zoho.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55930BB1.10502@zoho.com> <20150701065749.GA2411@sudip-PC>
 <55939890.6090903@zoho.com> <20150701080242.GD2411@sudip-PC>
In-Reply-To: <20150701080242.GD2411@sudip-PC>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: benjamin.romer@unisys.com, david.kershner@unisys.com, bryan.thompson@unisys.com, erik.arfvidson@unisys.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, sparmaintainer@unisys.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Wednesday 01 July 2015 01:32 PM, Sudip Mukherjee wrote:
> On Wed, Jul 01, 2015 at 01:06:48PM +0530, Sohny Thomas wrote:
> <snip>
>>> No, now this will introduce a new checkpatch warning that "else is not
>>> required after return". why did you introduce this "else"?
>> I did this so that the code is more readable and understandable, I
>> checked and checkpatch didn't call this out , so its clean.
>>
>> Otherwise the above code looks like this
>>
>> if(i)
>>    return 1;
>> return 0;
> you should update your tree. virtpci folder has been deleted from
> unisys driver.
> As you are using an old tree, maybe that explains why checkpatch is not
> giving the error.

This is from linux-stable branch and I updated  it just yesterday, so looks like the folders still there
> 
> regards
> sudip
> 

