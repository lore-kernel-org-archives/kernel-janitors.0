From: Nikolay Aleksandrov <nikolay@redhat.com>
Date: Fri, 01 Nov 2013 12:25:16 +0000
Subject: Re: [patch -next] bonding: bond_get_size() returns wrong size
Message-Id: <52739DAC.4000309@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131101101844.GA29795@longonot.mountain> <20131101104100.GU692@redhat.com> <20131101113558.GA3106@minipsycho.orion>
In-Reply-To: <20131101113558.GA3106@minipsycho.orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@resnulli.us>
Cc: Veaceslav Falico <vfalico@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>, Jay Vosburgh <fubar@us.ibm.com>, Andy Gospodarek <andy@greyhouse.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/01/2013 12:35 PM, Jiri Pirko wrote:
> Fri, Nov 01, 2013 at 11:41:00AM CET, vfalico@redhat.com wrote:
>> On Fri, Nov 01, 2013 at 01:18:44PM +0300, Dan Carpenter wrote:
>>> There is an extra semi-colon so bond_get_size() doesn't return the
>>> correct value.
>>>
>>> Fixes: ec76aa49855f ('bonding: add Netlink support active_slave option')
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> Hrm, how does it even build. Good catch, thanks.
> 
> I wonder about the same thing.
> 
+ and - can be unary operators so it's a valid expression :-)
Nice catch

Nik

