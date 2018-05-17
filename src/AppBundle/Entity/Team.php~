<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Team
 *
 * @ORM\Table(name="team")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\TeamRepository")
 */
class Team
{
    /**
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\Player", mappedBy="team")
     */
    private $players;

    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nationality", type="string", length=128)
     */
    private $nationality;

    /**
     * @var string
     *
     * @ORM\Column(name="flag_url", type="string", length=255)
     */
    private $flagUrl;


    /**
     * Get id.
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set nationality.
     *
     * @param string $nationality
     *
     * @return Team
     */
    public function setNationality($nationality)
    {
        $this->nationality = $nationality;

        return $this;
    }

    /**
     * Get nationality.
     *
     * @return string
     */
    public function getNationality()
    {
        return $this->nationality;
    }

    /**
     * Set flagUrl.
     *
     * @param string $flagUrl
     *
     * @return Team
     */
    public function setFlagUrl($flagUrl)
    {
        $this->flagUrl = $flagUrl;

        return $this;
    }

    /**
     * Get flagUrl.
     *
     * @return string
     */
    public function getFlagUrl()
    {
        return $this->flagUrl;
    }
}
