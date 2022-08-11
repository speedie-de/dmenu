/* speedie's dmenu configuration file
 * https://github.com/speedie-de/dmenu
 *
 * See 'man' page for more information
 *
 * NOTE: This build of dmenu does NOT prevent color emojis. Without patched libXft dmenu will CRASH!
 * To solve this, run 'make arch-libxftfix', 'make gentoo-libxftfix', or 'make libxftfix' to patch libXft!
 * Pywal support is also built in through the dmenu_run.
 * See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom         */
static int fuzzy = 1;                       /* -F option; if 0, dmenu doesn't use fuzzy matching */
static int centered = 0;
static int bordercentered = 1;              /* Draw border only when centered */
static int min_width = 500;
/* -fn option overrides fonts[0]; default X11 font or font set */
static char *fonts[] = { "DejaVu Sans Mono:size=8", "JoyPixels:size=10" };
static char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel] = { "#2e3440", "#81a1c1" },
	[SchemeOut] = { "#000000", "#5e81ac" },
    [SchemeSelHighlight] = { "#ffffff", "#000000" },
    [SchemeNormHighlight] = { "#ffffff", "#000000" },
};
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 1;
static unsigned int vertical   = 0; /* If != 0, show vertical instead of a horizontal listing */
static unsigned int columns    = 10;
static unsigned int lineheight = 5;
static unsigned int minlineheight = 5;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int borderwidth = 2;
