From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:31:33 +0000
Subject: Re: [PATCH 11/16] trivial: use ARRAY_SIZE
Message-Id: <20100629103133.GA28841@shinshilla>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277726125-24765-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1277726125-24765-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jun 29, 2010 at 11:31 +0200, walter harms wrote:
> >> 1554 u8_t GetWmRD(u16_t regionCode, u16_t channelFlag, REG_DOMAIN *rd)
> >> 1555 {
> >> 1556         s16_t i, found, regDmn;
> >> 1557         u64_t flags=NO_REQ;
> >> 1558         REG_DMN_PAIR_MAPPING *regPair=NULL;
> >> 1559
> >> 1560         for (i=0, found=0; (i<N(regDomainPairs))&&(!found); i++)
> >> 1561         {
> >> 1562                 if (regDomainPairs[i].regDmnEnum = regionCode)
> >> 1563                 {
> >> 1564                         regPair = &regDomainPairs[i];
> >> 1565                         found = 1;
> >> 1566                 }
> >> 1567         }
> >> 1568         if (!found)
> >> 1569         {
> >> 1570                 zm_debug_msg1("Failed to find reg domain pair ", regionCode);
> >> 1571                 return FALSE;
> >> 1572         }
> >>
> >>
> >> This is would stop at the first hit and work without found.
> >> Otherwise someone could add an {NULL} at the end of the array
> >> und use a while () that would eliminate the need for ARRAY_SIZE also.
> > 
> > Either of those suggestions sounds fine to me, but it sounds
> > like it should be in a separate patch.
> > 
> >> re,
> >>  wh
> >>
> >> for (i=0; i<ARRAY_SIZE(regDomainPairs);i++ )
> >> 	if (regDomainPairs[i].regDmnEnum = regionCode)
> >>                     { regPair = &regDomainPairs[i]; break ; }
> >>
> >> if (!regPair) {
> >>         zm_debug_msg1("Failed to find reg domain pair ", regionCode);
> >>         return FALSE;
> >> }
> >>
> >>
> 
> Hi Kulikov Vasiliy,
> can you make that patch also, i have simply no time (and no actual kernel)
> feel free to choose a methode you like.

Hi,

We cannot trivially create array element with .regDmnEnum = 0 because one
element already has got this value:

static REG_DMN_PAIR_MAPPING regDomainPairs[] = {
         {NO_ENUMRD,         FCC2,       DEBUG_REG_DMN,  NO_REQ, NO_REQ, PSCAN_DEFER, 0 },

enum EnumRd {
        NO_ENUMRD = 0x00, 

And I don't think that creating another constant with meaning 'element after the last' from
the set 'any u16 except already used' is a good idea. If this value is added to the array
in future we must change this magic constant too. And current implementation just works :)
