From: Phil Sutter <phil@nwl.cc>
Date: Sat, 18 Feb 2012 01:47:03 +0000
Subject: Re: boolean result from a test for a bit
Message-Id: <20120218014703.GA5729@nuty>
List-Id: <kernel-janitors.vger.kernel.org>
References: <804857E1F29AAC47BF68C404FC60A1842485E4@ORSMSX102.amr.corp.intel.com>
In-Reply-To: <804857E1F29AAC47BF68C404FC60A1842485E4@ORSMSX102.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 27, 2012 at 08:29:13PM +0000, Allan, Bruce W wrote:
> For a simple boolean test of whether, for example, bit 5 is set in the variable 'flags', which of the following methods is preferred over the other?
> 
> bool result = (flags & (1 << 5)) ? true : false;
> 
> or
> 
> bool result = !!(flags & (1 << 5));
> 
> I've seen examples of both in the Linux kernel.

I guess this is rather a matter of taste. Personally I compare
performance of different solutions if in doubt. S        result = !!(flags & (1 << 5));
o I added both ways
(plus a third one I've just made up) into a simple program, compiled it
using 'gcc -g test.c' and looked at the disassembly ('objdump -S
a.out'):

| int main(void)
| {
|  80483be:       55                      push   %ebp
|  80483b5:       89 e5                   mov    %esp,%ebp
|  80483b7:       83 ec 10                sub    $0x10,%esp
| 
|         char flags = 0xff;
|  80483ba:       c6 45 ff ff             movb   $0xff,-0x1(%ebp)
|         int result;
| 
|         result = (flags & (1 << 5)) ? 1 : 0;
|  80483be:       0f be 45 ff             movsbl -0x1(%ebp),%eax
|  80483c2:       83 e0 20                and    $0x20,%eax
|  80483c5:       85 c0                   test   %eax,%eax
|  80483c7:       0f 95 c0                setne  %al
|  80483ca:       0f b6 c0                movzbl %al,%eax
|  80483cd:       89 45 f8                mov    %eax,-0x8(%ebp)
|         result = !!(flags & (1 << 5));
|  80483d0:       0f be 45 ff             movsbl -0x1(%ebp),%eax
|  80483d4:       83 e0 20                and    $0x20,%eax
|  80483d7:       85 c0                   test   %eax,%eax
|  80483d9:       0f 95 c0                setne  %al
|  80483dc:       0f b6 c0                movzbl %al,%eax
|  80483df:       89 45 f8                mov    %eax,-0x8(%ebp)
| 
|         result = (flags >> 5) & 0x1;
|  80483e2:       0f b6 45 ff             movzbl -0x1(%ebp),%eax
|  80483e6:       c0 f8 05                sar    $0x5,%al
|  80483e9:       0f be c0                movsbl %al,%eax
|  80483ec:       83 e0 01                and    $0x1,%eax
|  80483ef:       89 45 f8                mov    %eax,-0x8(%ebp)
| 
|         return 0;
|  80483f2:       b8 00 00 00 00          mov    $0x0,%eax
| }

As you see, both of your choices generate identical code. Looking at the
code size, mine is the winner! :)

HTH, Phil
