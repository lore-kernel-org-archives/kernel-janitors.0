From: walter harms <wharms@bfs.de>
Date: Thu, 26 May 2005 18:27:47 +0000
Subject: Re: [KJ] [PATCH 2.6.11.10] arch/cris: fixes static strings declaration
Message-Id: <42961523.9050505@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26426247961297333=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050526122502.7aa13915.rnsanchez@terra.com.br>
In-Reply-To: <20050526122502.7aa13915.rnsanchez@terra.com.br>
To: kernel-janitors@vger.kernel.org

--===============26426247961297333==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

hi Alexey,
you ask for it :)

  cris-gcc -v
Reading specs from /usr/local/cris/lib/gcc-lib/cris/2.96/specs
gcc version 2.96 Axis release R46/1.25

testprogramm:

#include <stdio.h>
//char *foo = "blah";
char foo[]="blah";
int main()
{
printf("%s\n",foo);

}

  size test_string  (char [])
    text    data     bss     dec     hex filename
     769     252      36    1057     421 test_string


size test_string2  (char *)
    text    data     bss     dec     hex filename
     777     248      40    1065     429 test_string2


sorry, i could not resist :)

re,
	walter



Alexey Dobriyan wrote:
> On Thursday 26 May 2005 21:21, Ricardo Nabinger Sanchez wrote:
> 
>>Quoting  Alexey Dobriyan <adobriyan@gmail.com>
>>Sent on  Thu, 26 May 2005 20:35:55 +0400
>>
>>
>>>What's the difference in .text and .data sizes?
>>
>>It's small,
> 
> 
> I want to see size(1) output on cross-compiled .o
> 
> IIRC the difference depends on gcc version and can even be positive.
> 


--===============26426247961297333==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26426247961297333==--
