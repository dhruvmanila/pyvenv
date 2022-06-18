package cmd

import (
	"fmt"
	"log"
	"os"
	"path/filepath"

	"github.com/dhruvmanila/pyvenv/internal/project"
	"github.com/fatih/color"
	"github.com/spf13/cobra"
)

var (
	noColor        bool
	outputVenvInfo bool
)

var rootCmd = &cobra.Command{
	Use:     "pyvenv",
	Short:   "Personal tool to manage Python virtual environments.",
	Version: Version,
	Run: func(_ *cobra.Command, _ []string) {
		if outputVenvInfo {
			homeDir, err := os.UserHomeDir()
			if err != nil {
				log.Fatal(err)
			}

			path, err := os.Getwd()
			if err != nil {
				log.Fatal(err)
			}

			path, err = filepath.EvalSymlinks(path)
			if err != nil {
				log.Fatal(err)
			}

			// No virtual environments will ever be created in the User
			// home directory, so let's stop searching there.
			for path != homeDir {
				p, err := project.New(path)
				if err != nil {
					log.Fatal(err)
				}

				if stat, err := os.Stat(p.VenvDir); err == nil && stat.IsDir() {
					fmt.Println(p.VenvDir)
					break
				}

				path = filepath.Dir(path)
			}
		}
	},
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		os.Exit(1)
	}
}

func init() {
	cobra.OnInitialize(setColorOutput)
	rootCmd.Flags().BoolVar(&outputVenvInfo, "venv", false, "output virtualenv information")
	rootCmd.PersistentFlags().BoolVar(&noColor, "no-color", false, "disable color output")
}

func setColorOutput() {
	if noColor {
		color.NoColor = true
	}
}
