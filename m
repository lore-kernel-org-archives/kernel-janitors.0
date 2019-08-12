From: maowenan <maowenan@huawei.com>
Date: Mon, 12 Aug 2019 05:48:03 +0000
Subject: Re: [PATCH net-next] net: can: Fix compiling warning
Message-Id: <5018f6ca-53b5-c712-a012-a0fcda5c10c2@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190802033643.84243-1-maowenan@huawei.com>
 <0050efdb-af9f-49b9-8d83-f574b3d46a2e@hartkopp.net>
 <20190806135231.GJ1974@kadam>
 <6e1c5aa0-8ed3-eec3-a34d-867ea8f54e9d@hartkopp.net>
In-Reply-To: <6e1c5aa0-8ed3-eec3-a34d-867ea8f54e9d@hartkopp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Hartkopp <socketcan@hartkopp.net>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2019/8/7 0:41, Oliver Hartkopp wrote:
> Hello Dan,
> 
> On 06/08/2019 15.52, Dan Carpenter wrote:
>> On Fri, Aug 02, 2019 at 10:10:20AM +0200, Oliver Hartkopp wrote:
> 
>>> Btw. what kind of compiler/make switches are you using so that I can see
>>> these warnings myself the next time?
>>
>> These are Sparse warnings, not from GCC.
> 
> I compiled the code (the original version), but I do not get that "Should it be static?" warning:

Hello Oliver,

here are my steps for net/can/bcm.c,
make allmodconfig ARCH=mips CROSS_COMPILE=mips-linux-gnu-
make C=2 net/can/bcm.o ARCH=mips CROSS_COMPILE=mips-linux-gnu-

  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
  CALL    scripts/atomic/check-atomics.sh
  CHECK   net/can/bcm.c
./include/linux/slab.h:672:13: error: undefined identifier '__builtin_mul_overflow'
./include/linux/slab.h:672:13: error: not a function <noident>
./include/linux/slab.h:672:13: error: not a function <noident>
net/can/bcm.c:1683:5: warning: symbol 'bcm_sock_no_ioctlcmd' was not declared. Should it be static?
./include/linux/slab.h:672:13: warning: call with no type!
  CC [M]  net/can/bcm.o

for net/can/raw.c,
make allmodconfig ARCH=mips CROSS_COMPILE=mips-linux-gnu-
make C=2 net/can/raw.o ARCH=mips CROSS_COMPILE=mips-linux-gnu-

  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
  CALL    scripts/atomic/check-atomics.sh
  CHECK   net/can/raw.c
net/can/raw.c:840:5: warning: symbol 'raw_sock_no_ioctlcmd' was not declared. Should it be static?
  CC [M]  net/can/raw.o
