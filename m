From: Vicente Feito <vicente.feito@gmail.com>
Date: Mon, 28 Mar 2005 11:55:15 +0000
Subject: Re: [KJ] critical bug in strncpy()
Message-Id: <200503281155.16199.vicente.feito@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi walter,
I think the main problem is the fact that tmp++ keeps going when src++ stops, 
this can be fixed like this:
if ((*tmp = *src) != 0) { src++; tmp++; } <--- just adding brackets
with that I think you have all bases covered, otherwise tmp keeps 
incrementing, which doesn't have any sense in this case.
The other issue is the fact that if strlen(src) > count you get a non null 
terminated string, but that's the way it has been made.
And the final issue afaik is the waste of cpu cycles when the strings have 
ended copying themselves but the count is still > 0, but that's not a 
security issue.

Vicente.


On Monday 28 March 2005 02:34 pm, walter harms wrote:
> int main()
> {
> char *src="15" ;
> char dst[]="123";
>
> K_strncpy(dst,src,500);
>
> }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
