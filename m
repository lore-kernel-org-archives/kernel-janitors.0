From: Ingo Molnar <mingo@kernel.org>
Date: Fri, 26 Jun 2015 08:39:57 +0000
Subject: Re: [GIT PULL 0/7] perf/core improvements
Message-Id: <20150626083957.GB26303@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1435266618-10810-1-git-send-email-acme@kernel.org>
In-Reply-To: <1435266618-10810-1-git-send-email-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Andi Kleen <ak@linux.intel.com>, David Ahern <dsahern@gmail.com>, Jiri Olsa <jolsa@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Markus Elfring <elfring@users.sourceforge.net>, Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Stephane Eranian <eranian@google.com>, Arnaldo Carvalho de Melo <acme@redhat.com>


* Arnaldo Carvalho de Melo <acme@kernel.org> wrote:

> Hi Ingo,
> 
> 	Please consider pulling,
> 
> - Arnaldo
> 
> 
> The following changes since commit 27451700dfa01a05cdb4d9d74501536165158034:
> 
>   Merge tag 'perf-core-for-mingo' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux into perf/core (2015-06-25 09:28:42 +0200)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-core-for-mingo
> 
> for you to fetch changes up to a22e99cd74a31dee4b5241bd60a256c629c808da:
> 
>   perf tools: Make perf_evsel__(nr_)cpus generic (2015-06-25 17:15:39 -0300)
> 
> ----------------------------------------------------------------
> perf/core improvements and refactorings:
> 
> Infrastructure:
> 
> - Reference count the cpu_map and thread_map classes. (Jiri Olsa)
> 
> - Set evsel->{cpus,threads} from the evlist, if not set,
>   allowing the generalization of some 'perf stat' functions that
>   previously were accessing private static evlist variable. (Jiri Olsa)
> 
> - Delete an unnecessary check before the calling
>   free_event_desc() (Markus Elfring)
> 
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> ----------------------------------------------------------------
> Arnaldo Carvalho de Melo (1):
>       perf tools: Future-proof thread_map allocation size calculation
> 
> Jiri Olsa (5):
>       perf tools: Add reference counting for cpu_map object
>       perf tools: Add reference counting for thread_map object
>       perf evlist: Propagate cpu maps to evsels in an evlist
>       perf evlist: Propagate thread maps through the evlist
>       perf tools: Make perf_evsel__(nr_)cpus generic
> 
> Markus Elfring (1):
>       perf header: Delete an unnecessary check before the calling free_event_desc()
> 
>  tools/perf/builtin-stat.c                  | 10 ---------
>  tools/perf/tests/code-reading.c            |  4 ++--
>  tools/perf/tests/keep-tracking.c           |  4 ++--
>  tools/perf/tests/mmap-basic.c              |  4 ++--
>  tools/perf/tests/mmap-thread-lookup.c      |  2 +-
>  tools/perf/tests/openat-syscall-all-cpus.c |  2 +-
>  tools/perf/tests/openat-syscall.c          |  2 +-
>  tools/perf/tests/switch-tracking.c         |  4 ++--
>  tools/perf/util/cpumap.c                   | 26 ++++++++++++++++++++--
>  tools/perf/util/cpumap.h                   |  6 ++++-
>  tools/perf/util/evlist.c                   | 35 +++++++++++++++++++++++++-----
>  tools/perf/util/evsel.c                    |  2 ++
>  tools/perf/util/evsel.h                    | 12 ++++++++++
>  tools/perf/util/header.c                   |  3 +--
>  tools/perf/util/parse-events.c             |  5 ++++-
>  tools/perf/util/python.c                   |  4 ++--
>  tools/perf/util/record.c                   |  4 ++--
>  tools/perf/util/session.c                  |  2 +-
>  tools/perf/util/svghelper.c                |  2 +-
>  tools/perf/util/thread_map.c               | 32 ++++++++++++++++++++++++---
>  tools/perf/util/thread_map.h               |  7 ++++--
>  21 files changed, 129 insertions(+), 43 deletions(-)

Pulled, thanks a lot Arnaldo!

	Ingo
