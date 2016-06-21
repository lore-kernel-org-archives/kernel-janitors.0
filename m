From: walter harms <wharms@bfs.de>
Date: Tue, 21 Jun 2016 15:40:13 +0000
Subject: Re: [patch] staging: comedi: dt2811: fix a precedence bug
Message-Id: <57695FDD.2020609@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160621114621.GB16941@mwanda>
In-Reply-To: <20160621114621.GB16941@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 21.06.2016 15:56, schrieb Ian Abbott:
> On 21/06/16 12:46, Dan Carpenter wrote:
>> Bitwise | has higher precedence than ?: so we need to add some
>> parenthesis for this to work as intended.
>>
>> Fixes: 7c9574090d30 ('staging: comedi: dt2811: simplify A/D reference
>> configuration')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/staging/comedi/drivers/dt2811.c
>> b/drivers/staging/comedi/drivers/dt2811.c
>> index 904f6377..8bbd938 100644
>> --- a/drivers/staging/comedi/drivers/dt2811.c
>> +++ b/drivers/staging/comedi/drivers/dt2811.c
>> @@ -588,8 +588,8 @@ static int dt2811_attach(struct comedi_device
>> *dev, struct comedi_devconfig *it)
>>      s = &dev->subdevices[0];
>>      s->type        = COMEDI_SUBD_AI;
>>      s->subdev_flags    = SDF_READABLE |
>> -              (it->options[2] = 1) ? SDF_DIFF :
>> -              (it->options[2] = 2) ? SDF_COMMON : SDF_GROUND;
>> +              ((it->options[2] = 1) ? SDF_DIFF :
>> +               (it->options[2] = 2) ? SDF_COMMON : SDF_GROUND);
>>      s->n_chan    = (it->options[2] = 1) ? 8 : 16;
>>      s->maxdata    = 0x0fff;
>>      s->range_table    = board->is_pgh ? &dt2811_pgh_ai_ranges
>>
> 

perhaps we can improve readability with something like that (untested):

switch(it->options[2]) {
case 1:
     s->subdev_flags= SDF_READABLE|SDF_DIFF;
     break;
case 2:
     s->subdev_flags= SDF_READABLE|SDF_COMMON;
     break;
default:
     s->subdev_flags=SDF_READABLE|SDF_GROUND;
}

so everyone has a chance to see what is going on.

just my 2 cents,

re,
 wh


> Nice catch, thanks!
> 
> Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
> 
