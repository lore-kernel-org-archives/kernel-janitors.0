From: Oliver Hartkopp <socketcan@hartkopp.net>
Date: Tue, 06 Aug 2019 16:41:44 +0000
Subject: Re: [PATCH net-next] net: can: Fix compiling warning
Message-Id: <6e1c5aa0-8ed3-eec3-a34d-867ea8f54e9d@hartkopp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190802033643.84243-1-maowenan@huawei.com>
 <0050efdb-af9f-49b9-8d83-f574b3d46a2e@hartkopp.net>
 <20190806135231.GJ1974@kadam>
In-Reply-To: <20190806135231.GJ1974@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mao Wenan <maowenan@huawei.com>, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Dan,

On 06/08/2019 15.52, Dan Carpenter wrote:
> On Fri, Aug 02, 2019 at 10:10:20AM +0200, Oliver Hartkopp wrote:

>> Btw. what kind of compiler/make switches are you using so that I can see
>> these warnings myself the next time?
> 
> These are Sparse warnings, not from GCC.

I compiled the code (the original version), but I do not get that 
"Should it be static?" warning:

user@box:~/net-next$ make C=1
   CALL    scripts/checksyscalls.sh
   CALL    scripts/atomic/check-atomics.sh
   DESCEND  objtool
   CHK     include/generated/compile.h
   CHECK   net/can/af_can.c
./include/linux/sched.h:609:43: error: bad integer constant expression
./include/linux/sched.h:609:73: error: invalid named zero-width bitfield 
`value'
./include/linux/sched.h:610:43: error: bad integer constant expression
./include/linux/sched.h:610:67: error: invalid named zero-width bitfield 
`bucket_id'
   CC [M]  net/can/af_can.o
   CHECK   net/can/proc.c
./include/linux/sched.h:609:43: error: bad integer constant expression
./include/linux/sched.h:609:73: error: invalid named zero-width bitfield 
`value'
./include/linux/sched.h:610:43: error: bad integer constant expression
./include/linux/sched.h:610:67: error: invalid named zero-width bitfield 
`bucket_id'
   CC [M]  net/can/proc.o
   LD [M]  net/can/can.o
   CHECK   net/can/raw.c
./include/linux/sched.h:609:43: error: bad integer constant expression
./include/linux/sched.h:609:73: error: invalid named zero-width bitfield 
`value'
./include/linux/sched.h:610:43: error: bad integer constant expression
./include/linux/sched.h:610:67: error: invalid named zero-width bitfield 
`bucket_id'
   CC [M]  net/can/raw.o
   LD [M]  net/can/can-raw.o
   CHECK   net/can/bcm.c
./include/linux/sched.h:609:43: error: bad integer constant expression
./include/linux/sched.h:609:73: error: invalid named zero-width bitfield 
`value'
./include/linux/sched.h:610:43: error: bad integer constant expression
./include/linux/sched.h:610:67: error: invalid named zero-width bitfield 
`bucket_id'
   CC [M]  net/can/bcm.o
   LD [M]  net/can/can-bcm.o
   CHECK   net/can/gw.c
./include/linux/sched.h:609:43: error: bad integer constant expression
./include/linux/sched.h:609:73: error: invalid named zero-width bitfield 
`value'
./include/linux/sched.h:610:43: error: bad integer constant expression
./include/linux/sched.h:610:67: error: invalid named zero-width bitfield 
`bucket_id'
   CC [M]  net/can/gw.o
   LD [M]  net/can/can-gw.o
Kernel: arch/x86/boot/bzImage is ready  (#2)

I've seen that warning at different other code - but not in bcm.c & raw.c

I downloaded & compiled the latest sparse source. But still no "static" 
warning. Any idea?

Best regards,
Oliver
