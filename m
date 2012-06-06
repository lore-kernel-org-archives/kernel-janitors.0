From: Ian Abbott <abbotti@mev.co.uk>
Date: Wed, 06 Jun 2012 09:28:24 +0000
Subject: Re: [patch] staging: comedi: cleanup comedi_recognize()
Message-Id: <4FCF22B8.7060500@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120524102851.GA4399@elgon.mountain>
In-Reply-To: <20120524102851.GA4399@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2012-06-05 12:01, Dan Carpenter wrote:
> On Tue, Jun 05, 2012 at 12:06:10PM +0200, walter harms wrote:
>> Hi all,
>> the patch is fine with me but i have a few basic questions:
>>
>> Why the (void  *) at all ? it returns a name what is a const char *.
>>
>
> We're really returning a pointer to a private struct, it's just that
> the first element on the struct always has to be a pointer to char *.

To be pedantic, it's really returning a pointer to some member of type 
'const char *' within a private struct.  To make life easier for 
themselves, those drivers make that the first member of the private 
struct so a void pointer to the member is also a void pointer to the struct.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
