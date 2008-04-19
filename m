From: walter harms <WHarms@bfs.de>
Date: Sat, 19 Apr 2008 13:29:53 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <4809F3D1.7040606@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

i guess the idea of using unsigned int = -1 is to set all bit.
so you do not need something linux =UINT_MAX. That would fail if someone
changes int to long and not UINT_MAX.

IMHO the use of 'result' is not need. snd_sbdsp_get_byte will return int
i am worried because snd_sbdsp_get_byte() may return -ENODEV. what will
short do and why ?

maybe the autor wants this (not tested):


static int snd_sbdsp_version(sb_t * chip)
{
	int major,minor;
	if ( snd_sbdsp_command(chip, SB_DSP_GET_VERSION) =0)
	 return -ENODEV;

        major=snd_sbdsp_get_byte(chip) ;
	if( major<0)
		return -ENODEV;

	minor=snd_sbdsp_get_byte(chip) ;
	if( minor <0)
		return -ENODEV;

	return (major<<8)|minor ;

}

btw: is ANYONE using sb isa card these days ?

re,
 wh



Julia Lawall wrote:
> Does the initialization of result in the following code serve any purpose?
> 
> sound/isa/sb/sb_common.c:
> 
>  static int snd_sbdsp_version(struct snd_sb * chip)
>  {
>         unsigned int result = -ENODEV;
> 
>         snd_sbdsp_command(chip, SB_DSP_GET_VERSION);
>         result = (short) snd_sbdsp_get_byte(chip) << 8;
> 
> If result is unsigned, its value will never be -ENODEV, and anyway the 
> value is overwritten before it is ever used.
> 
> There are a couple of other cases like this.  There are also 
> initializations of unsigned variables to -1, which seem prevalent 
> enough that perhaps they serve some purpose.
> 
> julia
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
